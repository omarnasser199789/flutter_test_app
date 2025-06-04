import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/auth/data/data_sources/remot_data_sourse/auth_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/use_cases/login_usecase.dart';
import 'features/auth/domain/use_cases/logout_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Bloc
  sl.registerFactory(
    () => AuthBloc(
      concreteLoginUseCase: sl(),
      concreteLogoutUseCase: sl(),
    ),
  );

  ///Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(repository: sl()));

  ///Repository

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl(),
    ),
  );

  ///Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  /// External
  sl.registerLazySingleton(() => http.Client());
}

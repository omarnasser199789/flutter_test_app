import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/auth/data/data_sources/remote_data_source/auth_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/use_cases/login_usecase.dart';
import 'features/auth/domain/use_cases/logout_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/dashboard/data/data_sources/remote_data_source/dashboard_data_source.dart';
import 'features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'features/dashboard/domain/repositories/dashboard_repository.dart';
import 'features/dashboard/domain/use_cases/get_dashboard_data_usecase.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Bloc
  sl.registerFactory(
    () => AuthBloc(
      concreteLoginUseCase: sl(),
      concreteLogoutUseCase: sl(),
    ),
  );

  sl.registerFactory(
        () => DashboardBloc(
            concreteGetDashboardDataUsecase:  sl(),
    ),
  );

  ///Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetDashboardDataUsecase(repository: sl()));

  ///Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<DashboardRepository>(
        () => DashboardRepositoryImpl(
          dashboardRemoteDataSource: sl(),
    ),
  );

  ///Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<DashboardRemoteDataSource>(
        () => DashboardRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  /// External
  sl.registerLazySingleton(() => http.Client());
}

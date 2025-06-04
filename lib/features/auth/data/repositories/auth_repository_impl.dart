import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../data_sources/remote_data_source/auth_data_source.dart';
import 'auth_repository_functions.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  ConsultationsRepositoryFunctions functions = ConsultationsRepositoryFunctions();

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
  });

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParams params) async {
    return await functions.convertToLoginEntity(() {
      return authRemoteDataSource.login(params);
    });
  }

  @override
  Future<Either<Failure, int>> logout() async {
    return await functions.convertToInt(() {
      return authRemoteDataSource.logout();
    });
  }
}

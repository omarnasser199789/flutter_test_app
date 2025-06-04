import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/login_entity.dart';
import '../use_cases/login_usecase.dart';

abstract class AuthRepository{

  Future<Either<Failure,LoginEntity>> login(LoginParams params);
  Future<Either<Failure,int>> logout();

}
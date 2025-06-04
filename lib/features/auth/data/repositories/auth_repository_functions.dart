import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/functions.dart';
import '../../domain/entities/login_entity.dart';

typedef StatusCodeFunction = Future<int> Function();
typedef LoginEntityFunction = Future<LoginEntity> Function();

class ConsultationsRepositoryFunctions {

  Future<Either<Failure, int>> convertToInt(StatusCodeFunction function) async {
    return convertToEntity(function);
  }

  Future<Either<Failure, LoginEntity>> convertToLoginEntity(LoginEntityFunction function) async {
    return convertToEntity(function);
  }

}

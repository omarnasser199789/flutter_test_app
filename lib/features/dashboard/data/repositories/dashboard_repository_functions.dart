import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/functions.dart';
import '../../domain/entities/dashboard_entity.dart';

typedef StatusCodeFunction = Future<int> Function();
typedef DashboardEntityFunction = Future<DashboardEntity> Function();

class ConsultationsRepositoryFunctions {

  Future<Either<Failure, int>> convertToInt(StatusCodeFunction function) async {
    return convertToEntity(function);
  }

  Future<Either<Failure, DashboardEntity>> convertToDashboardEntity(DashboardEntityFunction function) async {
    return convertToEntity(function);
  }


}

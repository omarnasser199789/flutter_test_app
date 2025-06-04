import 'package:dartz/dartz.dart';
import 'package:flutter_test_app/features/dashboard/domain/entities/dashboard_entity.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardDataUsecase implements UseCase<DashboardEntity, int> {
  final DashboardRepository repository;
  GetDashboardDataUsecase({required this.repository});
  @override
  Future<Either<Failure,DashboardEntity>> call(int params) {
    return repository.getDashboardData();
  }
}
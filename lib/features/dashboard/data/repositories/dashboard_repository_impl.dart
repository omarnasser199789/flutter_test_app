import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../data_sources/remote_data_source/dashboard_data_source.dart';
import 'dashboard_repository_functions.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource dashboardRemoteDataSource;

  ConsultationsRepositoryFunctions functions = ConsultationsRepositoryFunctions();

  DashboardRepositoryImpl({
    required this.dashboardRemoteDataSource,
  });

  @override
  Future<Either<Failure, DashboardEntity>> getDashboardData() async {
    return await functions.convertToDashboardEntity(() {
      return dashboardRemoteDataSource.getDashboardData();
    });
  }
}

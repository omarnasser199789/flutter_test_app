import 'package:flutter_test_app/features/dashboard/data/model/dashboard_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/globals.dart';
import 'dashboard_data_source_function.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardModel> getDashboardData();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final http.Client client;

  DashboardRemoteDataSourceImpl({required this.client});
  DashboardRemoteDataFunctions function = DashboardRemoteDataFunctions();

  @override
  Future<DashboardModel> getDashboardData() {
    return function.getDashboardData('$baseUrl/lead/89');
  }

}

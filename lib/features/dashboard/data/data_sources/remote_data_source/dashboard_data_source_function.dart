import 'package:http/http.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_manager.dart';
import '../../model/dashboard_model.dart';

class DashboardRemoteDataFunctions {

  Future<DashboardModel> getDashboardData(String url) async {
    Response response = await ApiManager.get(url);
    if (response.statusCode == 200) {
      return dashboardModelFromJson(response.body);
    }else{
      throw exceptionHandling(response);
    }
  }

}

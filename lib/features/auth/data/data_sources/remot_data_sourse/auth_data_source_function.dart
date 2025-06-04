import 'package:http/http.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_manager.dart';
import '../../../domain/use_cases/login_usecase.dart';
import '../../model/login_model.dart';
import '../local_data_source/authentication_local_data_sources.dart';

class AuthRemoteDataFunctions {

  Future<LoginModel> login(String url,LoginParams params) async {
    Response response = await ApiManager.post(
        url:url,body: loginParamsToJson(params),
        useToken: true);

    if (response.statusCode == 200) {
      LoginModel  loginModel = loginModelFromJson(response.body);
      AuthLocalDataSourceImpl authLocalDataSourcesImpl = AuthLocalDataSourceImpl();
      authLocalDataSourcesImpl.cacheAuthentication(loginModel);
      return loginModel;
    }else{
      throw exceptionHandling(response);
    }
  }

  Future<int> logout(String url) async {
    Response response = await ApiManager.get(url);
    if (response.statusCode == 200) {
      return 200;
    }else{
      throw exceptionHandling(response);
    }
  }

}

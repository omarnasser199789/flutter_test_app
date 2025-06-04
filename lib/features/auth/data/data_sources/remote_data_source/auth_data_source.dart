import 'package:flutter_test_app/features/auth/data/model/login_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/globals.dart';
import '../../../domain/use_cases/login_usecase.dart';
import 'auth_data_source_function.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(LoginParams params);
  Future<int> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

AuthRemoteDataSourceImpl({required this.client});
AuthRemoteDataFunctions function = AuthRemoteDataFunctions();

  @override
  Future<LoginModel> login(LoginParams params) {
    return function.login('$baseUrl/login',params);
  }

  @override
  Future<int> logout() {
    return function.logout('$baseUrl/logout');
  }

}

import 'package:flutter/foundation.dart';
import '../error/exceptions.dart';
import '../storage/secure_storage_manager.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static  final Map<String, String> headers={};

  static Future<String?> getAuthToken() async {
    SecureStorageManager secureStorageManager =  SecureStorageManager();
    String? result = await secureStorageManager.read( key: SecureStorageManager.cachedJwtToken);
    return result;
  }

  static Future<Map<String, String>> getHeaders({bool? useToken}) async {
    final authToken = await getAuthToken();
    headers['Authorization'] = 'Bearer $authToken';
    headers['Content-type'] = 'application/json';
    headers['Accept'] = 'application/json';
    return headers;
  }
  static Future<http.Response> get(String url) async {
    if (kDebugMode) {print(url);}
    late http.Response response;
    try{
    final headers = await getHeaders();
    print(headers);

     response = await http.get(Uri.parse(url), headers: headers);
    if (kDebugMode) {print(response.statusCode);}
    return response;
    } catch (e) {
      if (kDebugMode) {print(e);}
      throw exceptionHandling(response);
    }
  }
  static Future<http.Response> post({required String url,Object? body, bool? useToken}) async {
    if (kDebugMode) {print(url);}
    late http.Response response;
    try{
      final headers = await getHeaders(useToken:useToken);
      response = await http.post(Uri.parse(url), headers: headers,body: body);
      if (kDebugMode) {print(response);}
      if (kDebugMode) {print(response.statusCode);}
      return response;
    } catch (e) {
      if (kDebugMode) {print(e);}
      throw exceptionHandling(response);
    }
  }
  static Future<http.Response> put({required String url,Object? body}) async {
    if (kDebugMode) {print(url);}
    late http.Response response;
    try{
      final headers = await getHeaders();
      if (kDebugMode) {print("Request Body:$body");}
      response = await http.put(Uri.parse(url), headers: headers,body: body);
      if (kDebugMode) {print(response.statusCode);}
      return response;
    } catch (e) {
      if (kDebugMode) {print(e);}
      throw exceptionHandling(response);
    }
  }
  static Future<http.Response> patch({required String url,Object? body}) async {
    if (kDebugMode) {print(url);}
    late http.Response response;
    try{
      final headers = await getHeaders();
      response = await http.patch(Uri.parse(url), headers: headers,body: body);
      if (kDebugMode) {print(response.statusCode);}
      return response;
    } catch (e) {
      if (kDebugMode) {print(e);}
      throw exceptionHandling(response);
    }
  }
  static Future<http.Response> delete({required String url}) async {
    if (kDebugMode) {print(url);}
    late http.Response response;
    try{
      final headers = await getHeaders();
      response = await http.delete(Uri.parse(url), headers: headers);
      if (kDebugMode) {print(response.statusCode);}
      return response;
    } catch (e) {
      if (kDebugMode) {print(e);}
      throw exceptionHandling(response);
    }
  }

}

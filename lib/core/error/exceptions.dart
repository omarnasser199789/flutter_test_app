
import 'dart:convert';

import 'package:http/http.dart';


dynamic exceptionHandling(Response response) {
  switch (response.statusCode) {
    case 400:
      throw BadRequestException(msg:json.decode(response.body)['message']);
    case 401:
      throw UnauthorisedException(msg:json.decode(response.body)['message']);
    case 403:
      String msg="";
      try{
        msg=json.decode(response.body)['message'];
      } catch (e) {
        msg = "ForbiddenException";
      }
      throw ForbiddenException(msg:msg);
    case 409:
      throw UserAlreadyExistsException(msg:json.decode(response.body)['message']);
    case 422:
      throw DuplicateEmailException(msg:json.decode(response.body)['message']);
    case 423:
      throw OTPException(msg:json.decode(response.body)['message']);
    case 429:
      throw ToManyRequestException(msg:json.decode(response.body)['message']);
    case 500:
      String msg="";
      try{
        msg=json.decode(response.body)['message'];
      } catch (e) {
        msg = "Rejected by firewall";
      }
      throw ServerException(msg:msg);
    case 503:
      String msg = "forbidden";
      throw ServerException(msg:msg);
    case 404:
      throw NotFoundException(msg:json.decode(response.body)['message']);
    default:
      throw ServerException(msg:json.decode(response.body)['message']);
  }
}


class ServerException implements Exception {
  ServerException({this.statusCode,required this.msg});
  int ? statusCode;
  String  msg;
}

class CacheException implements Exception {
  CacheException({required this.msg});
  String  msg;
}

class BadRequestException implements Exception {
  BadRequestException({required this.msg});
  String  msg;
}

class UnauthorisedException implements Exception {
  UnauthorisedException({required this.msg});
  String  msg;
}

class NotFoundException implements Exception {
  NotFoundException({required this.msg});
  String  msg;
}

class FetchDataException implements Exception {
  FetchDataException({required this.msg});
  String  msg;
}

class ToManyRequestException implements Exception {
  ToManyRequestException({required this.msg});
  String  msg;
}

class OTPException implements Exception {
  OTPException({required this.msg});
  String  msg;
}

class DuplicateEmailException implements Exception {
  DuplicateEmailException({required this.msg});
  String  msg;
}

class UserAlreadyExistsException implements Exception {
  UserAlreadyExistsException({required this.msg});
  String  msg;
}

class ForbiddenException implements Exception {
  ForbiddenException({required this.msg});
  String  msg;
}


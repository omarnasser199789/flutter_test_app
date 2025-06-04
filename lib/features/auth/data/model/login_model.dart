import 'dart:convert';

import '../../domain/entities/login_entity.dart';
import 'data.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel extends LoginEntity {
  final bool success_;
  final Data data_;
  final String message_;

  const LoginModel({
    required this.success_,
    required this.data_,
    required this.message_,
  }):super(
    success:success_,
    data:data_,
    message:message_,
  );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success_: json["success"],
    data_: Data.fromJson(json["data"]),
    message_: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}





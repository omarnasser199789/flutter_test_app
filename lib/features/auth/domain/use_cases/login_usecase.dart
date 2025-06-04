import 'package:dartz/dartz.dart';
import 'package:flutter_test_app/features/auth/domain/entities/login_entity.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';
import 'dart:convert';

class LoginUseCase implements UseCase<LoginEntity, LoginParams> {
  final AuthRepository repository;
  LoginUseCase({required this.repository});
  @override
    Future<Either<Failure,LoginEntity>> call(LoginParams params) {
    return repository.login(params);
  }
}

String loginParamsToJson(LoginParams data) => json.encode(data.toJson());

class LoginParams {
  /// Constructor that initializes email and password.
  LoginParams({
    required this.email,
    required this.password,
  });

  String email;
  String password;


  /// Returns a Map<String, dynamic> representation of the object.
  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
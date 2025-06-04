import '../../domain/entities/login_entity.dart';

abstract class AuthState {}

class Empty extends AuthState {}

class Loading extends AuthState {}

class Error extends AuthState {
  final String message;

  Error({required this.message}); //we use this constructor in ((BLOC & test))

  @override
  List<Object> get props => [message];
}

class SuccessLogin extends AuthState {
  LoginEntity loginEntity;
  SuccessLogin({required this.loginEntity});
}

class SuccessLogout extends AuthState {}

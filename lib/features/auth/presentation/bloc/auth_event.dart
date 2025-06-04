import '../../domain/use_cases/login_usecase.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  LoginParams params;

  LoginEvent({required this.params});
}
class LogoutEvent extends AuthEvent {}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/features/auth/presentation/bloc/success_error/either_success_or_error.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/logout_usecase.dart';
import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  // Add a StreamController to control test states
  final _testController = StreamController<AuthState>();

  AuthBloc({
    required LoginUseCase concreteLoginUseCase,
    required LogoutUseCase concreteLogoutUseCase,
    Stream<AuthState>? testStream,
  })  :
        loginUseCase = concreteLoginUseCase,
        logoutUseCase = concreteLogoutUseCase,
        super(Empty()) {
    // Use the provided testStream or the default stream controller
    testStream ??= _testController.stream;
    testStream.listen((state) {
      // emit(state);
    });
  }

  void emitTestState(AuthState state) {
    _testController.add(state);
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield Loading();
      final failureOrPhysician = await loginUseCase(event.params);
      yield* successLoginOrErrorState(failureOrPhysician);
    }else if (event is LogoutEvent) {
      yield Loading();
      final failureOrPhysician = await logoutUseCase(0);
      yield* successLogoutOrErrorState(failureOrPhysician);
    }
  }
}

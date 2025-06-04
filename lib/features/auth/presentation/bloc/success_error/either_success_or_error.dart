import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entities/login_entity.dart';
import '../auth_state.dart';

Stream<AuthState> successLoginOrErrorState(Either<Failure,LoginEntity> failureOrSuccess) async* {
  yield failureOrSuccess.fold(
        (failure) => Error(message: mapFailureToMessage(failure)),
        (loginEntity) => SuccessLogin(
            loginEntity: loginEntity
        ),
  );
}
Stream<AuthState> successLogoutOrErrorState(Either<Failure,int> failureOrSuccess) async* {
  yield failureOrSuccess.fold(
        (failure) => Error(message: mapFailureToMessage(failure)),
        (loginEntity) => SuccessLogout(),
  );
}





import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entities/dashboard_entity.dart';
import '../dashboard_state.dart';

Stream<DashboardState> successGetDashboardDataOrErrorState(Either<Failure,DashboardEntity> failureOrSuccess) async* {
  yield failureOrSuccess.fold(
        (failure) => Error(message: mapFailureToMessage(failure)),
        (entity) => SuccessGetDashboardData(
            entity: entity
        ),
  );
}






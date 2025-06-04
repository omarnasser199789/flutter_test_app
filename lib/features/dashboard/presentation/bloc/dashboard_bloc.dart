import 'dart:async';
import '../../domain/use_cases/get_dashboard_data_usecase.dart';
import 'bloc.dart';
import 'success_error/either_success_or_error.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardDataUsecase getDashboardDataUsecase;

  // Add a StreamController to control test states
  final _testController = StreamController<DashboardState>();

  DashboardBloc({
    required GetDashboardDataUsecase concreteGetDashboardDataUsecase,

    Stream<DashboardState>? testStream,
  })  :
        getDashboardDataUsecase = concreteGetDashboardDataUsecase,

        super(Empty()) {
    // Use the provided testStream or the default stream controller
    testStream ??= _testController.stream;
    testStream.listen((state) {
      // emit(state);
    });
  }

  void emitTestState(DashboardState state) {
    _testController.add(state);
  }

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is GetDashboardDataEvent) {
      yield Loading();
      final failureOrPhysician = await getDashboardDataUsecase(0);
      yield* successGetDashboardDataOrErrorState(failureOrPhysician);
    }
  }
}

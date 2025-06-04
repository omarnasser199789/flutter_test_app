
import '../../domain/entities/dashboard_entity.dart';

abstract class DashboardState {}

class Empty extends DashboardState {}

class Loading extends DashboardState {}

class Error extends DashboardState {
  final String message;

  Error({required this.message}); //we use this constructor in ((BLOC & test))

  @override
  List<Object> get props => [message];
}

class SuccessGetDashboardData extends DashboardState {
  DashboardEntity entity;
  SuccessGetDashboardData({required this.entity});
}

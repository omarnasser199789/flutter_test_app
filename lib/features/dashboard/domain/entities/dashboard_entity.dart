import 'package:equatable/equatable.dart';

import '../../data/model/dashboard_data.dart';

class DashboardEntity extends Equatable{
  final bool success;
  final DashboardData data;
  final String message;

  const DashboardEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  @override
  List<Object?> get props => [success, data, message];
}
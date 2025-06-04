import 'dart:convert';
import '../../domain/entities/dashboard_entity.dart';
import 'dashboard_data.dart';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel extends DashboardEntity{
  final bool success_;
  final DashboardData data_;
  final String message_;

  const DashboardModel({
    required this.success_,
    required this.data_,
    required this.message_,
  }):super(
    success:success_,
    data:data_,
    message:message_,
  );

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    success_: json["success"],
    data_: DashboardData.fromJson(json["data"]),
    message_: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}
import 'client_event.dart';
import 'client_log.dart';
import 'lead.dart';

class DashboardData {
  Lead lead;
  List<dynamic> tasks;
  List<ClientLog> clientLogs;
  List<ClientEvent> clientEvents;

  DashboardData({
    required this.lead,
    required this.tasks,
    required this.clientLogs,
    required this.clientEvents,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
    lead: Lead.fromJson(json["lead"]),
    tasks: List<dynamic>.from(json["tasks"].map((x) => x)),
    clientLogs: List<ClientLog>.from(json["clientLogs"].map((x) => ClientLog.fromJson(x))),
    clientEvents: List<ClientEvent>.from(json["clientEvents"].map((x) => ClientEvent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lead": lead.toJson(),
    "tasks": List<dynamic>.from(tasks.map((x) => x)),
    "clientLogs": List<dynamic>.from(clientLogs.map((x) => x.toJson())),
    "clientEvents": List<dynamic>.from(clientEvents.map((x) => x.toJson())),
  };
}
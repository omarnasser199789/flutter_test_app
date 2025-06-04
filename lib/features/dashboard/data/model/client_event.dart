import 'client.dart';
import 'dashboard_user.dart';

class ClientEvent {
  int id;
  int subjectId;
  String description;
  String startDate;
  String endDate;
  Client client;
  dynamic comments;
  int userId;
  bool isAccount;
  List<DashboardUser> users;
  String createdAt;
  String updatedAt;

  ClientEvent({
    required this.id,
    required this.subjectId,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.client,
    required this.comments,
    required this.userId,
    required this.isAccount,
    required this.users,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClientEvent.fromJson(Map<String, dynamic> json) => ClientEvent(
    id: json["id"],
    subjectId: json["subject_id"],
    description: json["description"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    client: Client.fromJson(json["client"]),
    comments: json["comments"],
    userId: json["user_id"],
    isAccount: json["isAccount"],
    users: List<DashboardUser>.from(json["users"].map((x) => DashboardUser.fromJson(x))),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subject_id": subjectId,
    "description": description,
    "start_date": startDate,
    "end_date": endDate,
    "client": client.toJson(),
    "comments": comments,
    "user_id": userId,
    "isAccount": isAccount,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
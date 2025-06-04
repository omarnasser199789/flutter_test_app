import 'dashboard_user.dart';
import 'lead_source.dart';
import 'location.dart';
import 'stage.dart';

class Lead {
  int id;
  String name;
  String company;
  LeadSource leadSource;
  Location location;
  Stage stage;
  String whatsppNumber;
  String phone;
  String email;
  dynamic industry;
  String comments;
  DashboardUser userId;
  int type;
  List<LeadSource> tags;
  String createdAt;
  String updatedAt;

  Lead({
    required this.id,
    required this.name,
    required this.company,
    required this.leadSource,
    required this.location,
    required this.stage,
    required this.whatsppNumber,
    required this.phone,
    required this.email,
    required this.industry,
    required this.comments,
    required this.userId,
    required this.type,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
    id: json["id"],
    name: json["name"],
    company: json["company"],
    leadSource: LeadSource.fromJson(json["lead_source"]),
    location: Location.fromJson(json["location"]),
    stage: Stage.fromJson(json["stage"]),
    whatsppNumber: json["whatspp_number"],
    phone: json["phone"],
    email: json["email"],
    industry: json["industry"],
    comments: json["comments"],
    userId: DashboardUser.fromJson(json["user_id"]),
    type: json["type"],
    tags: List<LeadSource>.from(json["tags"].map((x) => LeadSource.fromJson(x))),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "company": company,
    "lead_source": leadSource.toJson(),
    "location": location.toJson(),
    "stage": stage.toJson(),
    "whatspp_number": whatsppNumber,
    "phone": phone,
    "email": email,
    "industry": industry,
    "comments": comments,
    "user_id": userId.toJson(),
    "type": type,
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
class LeadSource {
  int id;
  String name;
  String description;
  int userId;
  String createdAt;
  String updatedAt;

  LeadSource({
    required this.id,
    required this.name,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LeadSource.fromJson(Map<String, dynamic> json) => LeadSource(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    userId: json["user_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
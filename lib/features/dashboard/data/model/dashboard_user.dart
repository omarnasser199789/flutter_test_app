class DashboardUser {
  int id;
  String name;
  String email;
  int status;
  int type;
  int roleId;
  String createdAt;
  String updatedAt;

  DashboardUser({
    required this.id,
    required this.name,
    required this.email,
    required this.status,
    required this.type,
    required this.roleId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DashboardUser.fromJson(Map<String, dynamic> json) => DashboardUser(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    status: json["status"],
    type: json["type"],
    roleId: json["role_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "status": status,
    "type": type,
    "role_id": roleId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
class User {
  int id;
  String name;
  String email;
  String password;
  int status;
  int type;
  String roleId;
  bool isAdmin;
  String createdAt;
  String updatedAt;
  List<dynamic> permissions;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.status,
    required this.type,
    required this.roleId,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    status: json["status"],
    type: json["type"],
    roleId: json["role_id"],
    isAdmin: json["isAdmin"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    permissions: List<dynamic>.from(json["permissions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "status": status,
    "type": type,
    "role_id": roleId,
    "isAdmin": isAdmin,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "permissions": List<dynamic>.from(permissions.map((x) => x)),
  };
}
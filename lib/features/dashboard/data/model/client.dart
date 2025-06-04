class Client {
  int id;
  String name;
  String whatsppNumber;
  String phone;
  String email;
  String comments;
  int userId;
  int type;
  String createdAt;
  String updatedAt;

  Client({
    required this.id,
    required this.name,
    required this.whatsppNumber,
    required this.phone,
    required this.email,
    required this.comments,
    required this.userId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"],
    name: json["name"],
    whatsppNumber: json["whatspp_number"],
    phone: json["phone"],
    email: json["email"],
    comments: json["comments"],
    userId: json["user_id"],
    type: json["type"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "whatspp_number": whatsppNumber,
    "phone": phone,
    "email": email,
    "comments": comments,
    "user_id": userId,
    "type": type,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
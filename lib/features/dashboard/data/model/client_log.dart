class ClientLog {
  int id;
  int typeId;
  String comments;
  int userId;
  String createdAt;
  String updatedAt;

  ClientLog({
    required this.id,
    required this.typeId,
    required this.comments,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClientLog.fromJson(Map<String, dynamic> json) => ClientLog(
    id: json["id"],
    typeId: json["type_id"],
    comments: json["comments"],
    userId: json["user_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type_id": typeId,
    "comments": comments,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
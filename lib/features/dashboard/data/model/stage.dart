class Stage {
  int id;
  String name;
  int status;
  int order;
  String color;
  int userId;
  bool lastStage;
  String createdAt;
  String updatedAt;

  Stage({
    required this.id,
    required this.name,
    required this.status,
    required this.order,
    required this.color,
    required this.userId,
    required this.lastStage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    order: json["order"],
    color: json["color"],
    userId: json["user_id"],
    lastStage: json["last_stage"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "order": order,
    "color": color,
    "user_id": userId,
    "last_stage": lastStage,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
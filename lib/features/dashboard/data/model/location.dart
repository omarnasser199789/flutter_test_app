class Location {
  int id;
  String city;
  String district;
  String description;
  int userId;
  String createdAt;
  String updatedAt;

  Location({
    required this.id,
    required this.city,
    required this.district,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    city: json["city"],
    district: json["district"],
    description: json["description"],
    userId: json["user_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city": city,
    "district": district,
    "description": description,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
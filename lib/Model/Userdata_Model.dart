// import 'dart:convert';
//
// List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str)..map((x) => UserModel.fromJson(x)));
//
// String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class UserModel {
  int status;
  String message;
  String token;
  Data data;

  UserModel({
    required this.status,
    required this.message,
    required this.token,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "data": data.toJson(),
  };
}

class Data {
  String email;
  String password;
  String name;
  String status;
  List<dynamic> posts;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Data({
    required this.email,
    required this.password,
    required this.name,
    required this.status,
    required this.posts,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    password: json["password"],
    name: json["name"],
    status: json["status"],
    posts: List<dynamic>.from(json["posts"].map((x) => x)),
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "name": name,
    "status": status,
    "posts": List<dynamic>.from(posts.map((x) => x)),
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}




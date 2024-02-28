// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String id;
  String name;
  String age;
  String emailid;
  String password;

  Welcome({
    required this.id,
    required this.name,
    required this.age,
    required this.emailid,
    required this.password,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["_id"],
    name: json["name"],
    age: json["age"],
    emailid: json["emailid"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "age": age,
    "emailid": emailid,
    "password": password,
  };
}

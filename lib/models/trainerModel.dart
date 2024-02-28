// To parse this JSON data, do
//
//     final trainer = trainerFromJson(jsonString);

import 'dart:convert';

List<Trainer> trainerFromJson(String str) => List<Trainer>.from(json.decode(str).map((x) => Trainer.fromJson(x)));

String trainerToJson(List<Trainer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trainer {
  String name;
  String age;
  String emailid;
  String password;

  Trainer({
    required this.name,
    required this.age,
    required this.emailid,
    required this.password,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
    name: json["name"],
    age: json["age"],
    emailid: json["emailid"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "emailid": emailid,
    "password": password,
  };
}

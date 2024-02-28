// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  String name;
  String place;
  String age;
  String height;
  String weight;
  String bloodGroup;
  String email;
  String password;
  String packageId;
  int previousPackageAmount;
  DateTime registerDate;
  DateTime lastPackageUpdateDate;

  Users({
    required this.name,
    required this.place,
    required this.age,
    required this.height,
    required this.weight,
    required this.bloodGroup,
    required this.email,
    required this.password,
    required this.packageId,
    required this.previousPackageAmount,
    required this.registerDate,
    required this.lastPackageUpdateDate,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    name: json["name"],
    place: json["place"],
    age: json["age"],
    height: json["height"],
    weight: json["weight"],
    bloodGroup: json["bloodGroup"],
    email: json["email"],
    password: json["password"],
    packageId: json["packageId"],
    previousPackageAmount: json["previousPackageAmount"],
    registerDate: DateTime.parse(json["registerDate"]),
    lastPackageUpdateDate: DateTime.parse(json["lastPackageUpdateDate"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "place": place,
    "age": age,
    "height": height,
    "weight": weight,
    "bloodGroup": bloodGroup,
    "email": email,
    "password": password,
    "packageId": packageId,
    "previousPackageAmount": previousPackageAmount,
    "registerDate": registerDate.toIso8601String(),
    "lastPackageUpdateDate": lastPackageUpdateDate.toIso8601String(),
  };
}
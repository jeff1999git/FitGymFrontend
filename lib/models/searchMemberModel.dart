// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

List<Search> searchFromJson(String str) => List<Search>.from(json.decode(str).map((x) => Search.fromJson(x)));

String searchToJson(List<Search> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Search {
  String name;
  String place;
  String age;
  String height;
  String weight;
  String bloodGroup;
  String email;
  DateTime registerDate;
  String packageName;
  String packageAmount;
  String dueAmount;
  int remainingDaysForNextDue;

  Search({
    required this.name,
    required this.place,
    required this.age,
    required this.height,
    required this.weight,
    required this.bloodGroup,
    required this.email,
    required this.registerDate,
    required this.packageName,
    required this.packageAmount,
    required this.dueAmount,
    required this.remainingDaysForNextDue,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    name: json["name"],
    place: json["place"],
    age: json["age"],
    height: json["height"],
    weight: json["weight"],
    bloodGroup: json["bloodGroup"],
    email: json["email"],
    registerDate: DateTime.parse(json["registerDate"]),
    packageName: json["package_name"],
    packageAmount: json["package_amount"],
    dueAmount: json["dueAmount"],
    remainingDaysForNextDue: json["remainingDaysForNextDue"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "place": place,
    "age": age,
    "height": height,
    "weight": weight,
    "bloodGroup": bloodGroup,
    "email": email,
    "registerDate": registerDate.toIso8601String(),
    "package_name": packageName,
    "package_amount": packageAmount,
    "dueAmount": dueAmount,
    "remainingDaysForNextDue": remainingDaysForNextDue,
  };
}

// To parse this JSON data, do
//
//     final viewws = viewwsFromJson(jsonString);

import 'dart:convert';

List<Viewws> viewwsFromJson(String str) => List<Viewws>.from(json.decode(str).map((x) => Viewws.fromJson(x)));

String viewwsToJson(List<Viewws> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Viewws {
  String name;
  String email;
  String packageName;
  String dueAmount;
  int remainingDaysForNextDue;

  Viewws({
    required this.name,
    required this.email,
    required this.packageName,
    required this.dueAmount,
    required this.remainingDaysForNextDue,
  });

  factory Viewws.fromJson(Map<String, dynamic> json) => Viewws(
    name: json["name"],
    email: json["email"],
    packageName: json["package_name"],
    dueAmount: json["dueAmount"],
    remainingDaysForNextDue: json["remainingDaysForNextDue"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "package_name": packageName,
    "dueAmount": dueAmount,
    "remainingDaysForNextDue": remainingDaysForNextDue,
  };
}

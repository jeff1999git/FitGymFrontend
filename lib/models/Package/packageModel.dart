// To parse this JSON data, do
//
//     final package = packageFromJson(jsonString);

import 'dart:convert';

List<Package> packageFromJson(String str) => List<Package>.from(json.decode(str).map((x) => Package.fromJson(x)));

String packageToJson(List<Package> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Package {
  String packageName;
  String packageDes;
  String packageAmount;

  Package({
    required this.packageName,
    required this.packageDes,
    required this.packageAmount,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    packageName: json["packageName"],
    packageDes: json["packageDes"],
    packageAmount: json["packageAmount"],
  );

  Map<String, dynamic> toJson() => {
    "packageName": packageName,
    "packageDes": packageDes,
    "packageAmount": packageAmount,
  };
}

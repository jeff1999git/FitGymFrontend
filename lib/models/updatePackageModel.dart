// To parse this JSON data, do
//
//     final package = packageFromJson(jsonString);

import 'dart:convert';

List<Package> packageFromJson(String str) => List<Package>.from(json.decode(str).map((x) => Package.fromJson(x)));

String packageToJson(List<Package> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Package {
  Id id;
  Id userId;
  V v;
  Id packageId;
  UpdatedDate updatedDate;
  String email;
  String packagename;

  Package({
    required this.id,
    required this.userId,
    required this.v,
    required this.packageId,
    required this.updatedDate,
    required this.email,
    required this.packagename,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    id: Id.fromJson(json["_id"]),
    userId: Id.fromJson(json["userId"]),
    v: V.fromJson(json["__v"]),
    packageId: Id.fromJson(json["packageId"]),
    updatedDate: UpdatedDate.fromJson(json["updatedDate"]),
    email: json["email"],
    packagename: json["packagename"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.toJson(),
    "userId": userId.toJson(),
    "__v": v.toJson(),
    "packageId": packageId.toJson(),
    "updatedDate": updatedDate.toJson(),
    "email": email,
    "packagename": packagename,
  };
}

class Id {
  String oid;

  Id({
    required this.oid,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    oid: json["\u0024oid"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024oid": oid,
  };
}

class UpdatedDate {
  Date date;
  String? email;
  String? packagename;

  UpdatedDate({
    required this.date,
    this.email,
    this.packagename,
  });

  factory UpdatedDate.fromJson(Map<String, dynamic> json) => UpdatedDate(
    date: Date.fromJson(json["\u0024date"]),
    email: json["email"],
    packagename: json["packagename"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024date": date.toJson(),
    "email": email,
    "packagename": packagename,
  };
}

class Date {
  String numberLong;

  Date({
    required this.numberLong,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    numberLong: json["\u0024numberLong"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024numberLong": numberLong,
  };
}

class V {
  String numberInt;

  V({
    required this.numberInt,
  });

  factory V.fromJson(Map<String, dynamic> json) => V(
    numberInt: json["\u0024numberInt"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024numberInt": numberInt,
  };
}

import 'dart:convert';

List<Member> membersFromJson(String str) =>
    List<Member>.from(json.decode(str).map((x) => Member.fromJson(x)));

String membersToJson(List<Member> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Member {
  String name;
  String email;
  String packageName;
  Package packageDetails; // Include package details here
  double dueAmount;
  int remainingDaysForNextDue;

  Member({
    required this.name,
    required this.email,
    required this.packageName,
    required this.packageDetails,
    required this.dueAmount,
    required this.remainingDaysForNextDue,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    name: json["name"],
    email: json["email"],
    packageName: json["package_name"],
    packageDetails: Package.fromJson(json["package_details"]),
    dueAmount: json["dueAmount"].toDouble(),
    remainingDaysForNextDue: json["remainingDaysForNextDue"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "package_name": packageName,
    "package_details": packageDetails.toJson(),
    "dueAmount": dueAmount,
    "remainingDaysForNextDue": remainingDaysForNextDue,
  };
}

class Package {
  String packageName;
  String packageDes;
  double packageAmount;

  Package({
    required this.packageName,
    required this.packageDes,
    required this.packageAmount,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    packageName: json["packageName"],
    packageDes: json["packageDes"],
    packageAmount: json["packageAmount"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "packageName": packageName,
    "packageDes": packageDes,
    "packageAmount": packageAmount,
  };
}

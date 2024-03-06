// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

List<Payment> paymentFromJson(String str) => List<Payment>.from(json.decode(str).map((x) => Payment.fromJson(x)));

String paymentToJson(List<Payment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payment {
  String memberId;
  String packageId;
  String paymentDate;
  String status;

  Payment({
    required this.memberId,
    required this.packageId,
    required this.paymentDate,
    required this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    memberId: json["memberId"],
    packageId: json["packageId"],
    paymentDate: json["paymentDate"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "packageId": packageId,
    "paymentDate": paymentDate,
    "status": status,
  };
}

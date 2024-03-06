import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fitgym/models/transactionModel.dart';

class PaymentApiService {

  Future<dynamic> createTransaction(String memberId, String packageId) async {
    var client = http.Client();
    var apiUrl = Uri.parse(
        "http://localhost:3001/api/transaction/transactions");
    var response = await client.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "memberId": memberId,
          "packageId": packageId
        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("failed");
    }
  }

  Future<List<Payment>> viewTransaction() async {
    var client = http.Client();
    var apiUrl = Uri.parse("http://localhost:3001/api/transaction/trans");
    var response = await client.get(apiUrl);
    if (response.statusCode == 200) {
      return paymentFromJson(response.body);
    }
    else {
      return [];
    }
  }
}
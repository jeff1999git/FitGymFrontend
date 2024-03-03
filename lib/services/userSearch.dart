import 'dart:convert';
import 'package:fitgym/models/searchMemberModel.dart';
import 'package:http/http.dart'as http;

class SearchServiceApi {

  getData(String email) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://localhost:3001/api/member/viewmemberdetails");
    var response = await client.post(apiUri,
      headers: <String, String>
      {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>
      {
        "email": email
      }
      ),
    );
    if (response.statusCode == 200) {
      var resp = response.body;
      return searchFromJson(resp);
    }
    else {
      throw Exception("no data");
    }
  }
}
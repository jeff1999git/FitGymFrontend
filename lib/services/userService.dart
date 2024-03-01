import 'dart:convert';

import 'package:fitgym/models/userModel.dart';
import 'package:http/http.dart'as http;

class UserServiceApi{

  Future<List<Member>> getProfile(String userId) async
  {
    var client = http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/member/viewmemberprofile");
    var response=await client.post(apiUrl);
    if(response.statusCode==200)
    {
      return membersFromJson(response.body);
    }
    else
    {
      return [];
    }
  }

  Future<dynamic> searchData(String email) async
  {
    var client = http.Client();
    var apiUrl = Uri.parse("http://localhost:3001/api/member/viewmemberdetails");

    var response = await client.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "email": email,
        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("failed to search");
    }
  }

  Future<dynamic> signInData(String email, String password) async{
    var client = http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/member/signin");
    var response=await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "email": email,
          "password": password
        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("Failed to login");
    }
  }
}
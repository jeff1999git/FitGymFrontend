import 'dart:convert';

import 'package:fitgym/models/userModel.dart';
import 'package:http/http.dart'as http;

class UserServiceApi{

  Future<List<Users>> getProfile() async
  {
    var client = http.Client();
    var apiUrl=Uri.parse("http://192.168.1.4:3001/api/member/viewmemberprofile");
    var response=await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return usersFromJson(response.body);
    }
    else
    {
      return [];
    }
  }

  Future<dynamic> signInData(String email, String password) async{
    var client = http.Client();
    var apiUrl=Uri.parse("http://192.168.1.4:3001/api/member/signin");
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
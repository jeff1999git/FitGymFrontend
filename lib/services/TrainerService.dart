import 'dart:convert';

import 'package:http/http.dart' as http;
class Trainer
{
  Future<dynamic> TrainerLogin(
      String email,String password
      )async
  {
    var client= http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/trainer/signintrainer");
    var response=await client.post(apiUrl,
    headers: <String,String>
    {
      "Content-Type":"application/json; charset=UTF-8"
    },
      body: jsonEncode(<String,String>
      {
        "emailid":email,
        "password":password
      }
      )
    );
    if(response.statusCode==200)
      {
        return json.decode(response.body);
      }
    else
      {
        throw Exception("failed to load data");
      }
  }
}
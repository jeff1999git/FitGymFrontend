import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fitgym/models/trainerModel.dart';

class TrainerApiService{
  Future<dynamic> logData(
      String email,String password
      ) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.100.143:3001/api/signin/signin");
    var response = await client.post(apiUri,
      headers: <String,String>
      {
        "Content-Type":"application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>
      {
        "emailid" : email,
        "password" : password
      }
      ),
    );
    if(response.statusCode==200)
    {
      var resp = response.body;
      return jsonDecode(resp);
    }
    else
    {
      throw Exception("Failed to send data");
    }
  }
  Future<List<Trainer>> getTrainer()async{
    var client = http.Client();
    var apiUrl =Uri.parse("http://localhost:3001/api/trainer/viewtrainers");
    var response=await client.get(apiUrl);
    if(response.statusCode==200){
      return trainerFromJson(response.body);
    }
    else{
      return [];
    }
  }
Future<dynamic>sendData(String name,String age,String emailid,String password)async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/trainer/addtrainer");
    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type":"application/json;charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
      "name": name,
      "age": age,
      "emailid": emailid,
      "password": password,
    })
    );
    if(response.statusCode==200){
      return json.decode(response.body);
    }
    else{
      throw Exception("Failure to add");
    }
}

}
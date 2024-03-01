import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fitgym/models/trainerModel.dart';

class TrainerApiService{

  Future<dynamic>searchTrainer(String emailid)async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/trainer/searchtrainer");
    var response=await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type":"application/json;charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "emailid":emailid,
        })
    );
    if(response.statusCode==200){
      return json.decode(response.body);
    }
    else{
      throw Exception("Failed to search");
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
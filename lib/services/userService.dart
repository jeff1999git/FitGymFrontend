import 'dart:convert';
import 'package:http/http.dart'as http;

class UserServiceApi{

  Future<List<dynamic>> fetchPackages() async {
    final response = await http.get(Uri.parse('http://192.168.50.143:3001/api/member/packages'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch packages');
    }
  }
  Future<dynamic> signUpData(String name,String place,String age,String height,String weight,String bloodGroup,String email,String password,String packageId) async{
    var client = http.Client();
    var apiUrl=Uri.parse("http://192.168.50.143:3001/api/member/addmember");
    var response=await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "name": name,
          "place": place,
          "age": age,
          "height": height,
          "weight": weight,
          "bloodGroup": bloodGroup,
          "email": email,
          "password": password,
          "packageId": packageId
        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("Failed to Add");
    }
  }


  Future<dynamic> signInData(String email, String password) async{
    var client = http.Client();
    var apiUrl=Uri.parse("http://192.168.50.143:3001/api/member/signin");
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
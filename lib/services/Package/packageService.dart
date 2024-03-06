import 'dart:convert';
import 'package:http/http.dart' as http;

class PackageApiService {
  Future<dynamic> AddPackageData(String packageName, String packageDes,String packageAmount) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.1.5:3001/api/package/addpackage");
    var response = await client.post(apiUri,
      headers: <String, String>
      {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>
      {"packageName": packageName,
        "packageDes": packageDes,
        "packageAmount": packageAmount
      }
      ),
    );
    if (response.statusCode == 200) {
      var resp = response.body;
      return jsonDecode(resp);
    }
    else {
      throw Exception("Failed to send data");
    }
  }
}
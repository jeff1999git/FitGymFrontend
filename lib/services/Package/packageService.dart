import 'dart:convert';
import 'package:fitgym/models/Package/packageModel.dart';
import 'package:http/http.dart' as http;

class PackageApiService {
  Future<dynamic> AddPackageData(String packageName, String packageDes,String packageAmount) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://localhost:3001/api/package/addpackage");
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

  Future<List<Package>> getPackages() async {
    var client = http.Client();
    var apiUrl = Uri.parse("http://localhost:3001/api/package/viewallpackage");
    var response = await client.get(apiUrl);
    if (response.statusCode == 200) {
      return packageFromJson(response.body);
    }
    else {
      return [];
    }
  }
}
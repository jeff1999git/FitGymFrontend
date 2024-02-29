import 'dart:convert';
import 'package:http/http.dart' as http;

class updatePackageApiService {

  Future<List<dynamic>> fetchPackages() async {
    final response = await http.get(Uri.parse('http://192.168.50.143:3001/api/member/packages'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch packages');
    }
  }

  Future<dynamic> UpdatePackageData(String email,String packagename) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.50.143:3001/api/package/updatepackage");
    var response = await client.post(apiUri,
      headers: <String, String>
      {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>
      {   "email": email,
        "packagename": packagename
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
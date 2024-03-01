import 'package:http/http.dart' as http;
import '../models/userViewModel.dart';

class MemberViewApiService
{
  Future<List<Viewws >> getViews() async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://10.0.16.12:3001/api/member/view_all");
    var response = await client.get(apiUri);
    if(response.statusCode == 200)
    {
      var resp = response.body;
      return viewwsFromJson(resp);
    }
    else
    {
      return [];
    }
  }
}
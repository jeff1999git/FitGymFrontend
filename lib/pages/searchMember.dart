import 'package:flutter/material.dart';
import '../models/searchMemberModel.dart';
import '../models/userModel.dart';
import '../services/userSearch.dart';

class searchMember extends StatefulWidget {
  const searchMember({super.key});

  @override
  State<searchMember> createState() => _searchMemberState();
}

class _searchMemberState extends State<searchMember> {
  String email="";
  TextEditingController controller_1 = new TextEditingController();
  List<Search> searchResults = [];

  void searchapi() async {
    email = controller_1.text;
    final response = await SearchServiceApi().getData(email);
    print("Response: $response");
    if (response != null) {
      setState(() {
        searchResults = response;
      });
      if (response.isNotEmpty) {
        // Results found
        print("Results found");
      } else {
        // No results found
        print("No results found");
        showSimplePopup(context, "No results found for the given email.");
      }
    } else {
      // Response is null
      print("Response is null.");
      showSimplePopup(context, "Error: Unable to fetch data. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(style: IconButton.styleFrom(
              foregroundColor: Colors.white
          ),
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.black,
          title: Text("Search Member",style: TextStyle(color: Colors.white),),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller_1,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 50,
                width: 200,
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                    onPressed: searchapi , child: Text("Search"))
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context,index)
                  {
                    final memb = searchResults[index];
                    return ListTile(
                      tileColor: Colors.lightBlueAccent.withOpacity(0.3),
                      title: Text("Name: "+memb.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      subtitle: Text("Place: "+memb.place+ "\n" +"Age: "+memb.age + "\n" +"Email: "+memb.email + "\n" +"Due Amount: "+memb.dueAmount + "\n" +"Register Date: "+memb.registerDate.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      leading: CircleAvatar(
                        child: Text(memb.name[0]),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
  void showSimplePopup(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(s),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
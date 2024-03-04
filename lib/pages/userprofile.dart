import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitgym/services/userService.dart';
// Assuming UserServiceApi is correctly implemented elsewhere

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<Map<String, dynamic>> searchResult = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userEmail = prefs.getString("email") ?? "";
    print(userEmail);
    // Corrected assumption: UserServiceApi().searchData() returns a Future that resolves to a list of user data
    try {
      final response = await UserServiceApi().searchData(userEmail);
      if (response != null && mounted) {
        setState(() {
          searchResult = List<Map<String, dynamic>>.from(response);
        });
      }
    } catch (e) {
      // Handling exceptions that might be thrown by UserServiceApi().searchData()
      print("Error fetching user data: $e");
      // Optionally, show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(style: IconButton.styleFrom(
            foregroundColor: Colors.white
        ),
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)) ,
        title: Text("MY INFO",style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Expanded(child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder:(context,index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(searchResult[index]['name'][0]),
                      ),
                      title: Text("Name: ${searchResult[index]['name']}"),
                      subtitle: Text("Place: ${searchResult[index]['place']}"+"\nAge: ${searchResult[index]['age']}"+"\nHeight: ${searchResult[index]['height']}"+"\nWeight: ${searchResult[index]['weight']}"
                          +"\nBloodgroup: ${searchResult[index]['bloodGroup']}"+"\nEmail: ${searchResult[index]['email']}"+"\nRegisterdate: ${searchResult[index]['registerDate']}"+"\npackagename: ${searchResult[index]['package_name']}"+"\nPackage Amount: ${searchResult[index]['package_amount']}"+"\nDue Amount: ${searchResult[index]['dueAmount']}"),
                    ),
                  );
                } ))
          ],
        ),
      ),
    );
  }
}
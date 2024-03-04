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
  Map<String, dynamic> searchResult={};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userEmail = prefs.getString("email") ?? "";
    String userTok = prefs.getString("token") ?? "";
    print(userEmail);
    print("Token is:"+userTok);
    // Corrected assumption: UserServiceApi().searchData() returns a Future that resolves to a list of user data
    try {
      final response = await UserServiceApi().searchData(userEmail, userTok);
      if (response != null && mounted) {
        setState(() {
          searchResult = Map<String, dynamic>.from(response);
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
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Expanded(child: ListView.builder(
                itemCount: 1,
                itemBuilder:(context,index){
                  return Card(
                    child: ListTile(
                      title: Text("Name: ${searchResult['name']}"),
                      subtitle: Text("Place: ${searchResult['place']}"+"\nAge: ${searchResult['age']}"+"\nHeight: ${searchResult['height']}"+"\nWeight: ${searchResult['weight']}"
                          +"\nBloodgroup: ${searchResult['bloodGroup']}"+"\nEmail: ${searchResult['email']}"+"\nRegisterdate: ${searchResult['registerDate']}"+"\npackagename: ${searchResult['package_name']}"+"\nPackage Amount: ${searchResult['package_amount']}"+"\nDue Amount: ${searchResult['dueAmount']}"),
                    ),
                  );
                } ))
          ],
        ),
      ),
    );
  }
}
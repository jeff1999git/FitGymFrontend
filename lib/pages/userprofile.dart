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
                        title: Text("Name: ${searchResult[index]['name']}"),
                        subtitle: Text("Phone: ${searchResult[index]['phone']}"),
                      ),
                    );
                  } ))
            ],
          ),
        ),
    );
  }
}
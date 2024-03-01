import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitgym/services/userService.dart';
// Assuming UserServiceApi is correctly implemented elsewhere

class UserProfile1 extends StatefulWidget {
  const UserProfile1({Key? key}) : super(key: key);

  @override
  State<UserProfile1> createState() => _UserProfile1State();
}

class _UserProfile1State extends State<UserProfile1> {
  List<Map<String, dynamic>> searchResult = [];
  String? userId;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userEmail = prefs.getString("email");
    print(userEmail);

    // Retrieve user ID using the email
    try {
      final response = await UserServiceApi().searchData(userEmail!);
      if (response != null) {
        setState(() {
          userId = response;
          print(userId);// Set the userId obtained from the email
        });
        // Now perform the search using the retrieved userId
        final userData = await UserServiceApi().searchData(userId!);
        if (userData != null && mounted) {
          setState(() {
            searchResult = List<Map<String, dynamic>>.from(userData);
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
      // Handle error
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

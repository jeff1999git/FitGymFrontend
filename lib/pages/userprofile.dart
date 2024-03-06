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
  Map<String, dynamic>? userProfile; // Updated to hold a single user profile

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userid = prefs.getString("userid") ?? "";
    String userTok = prefs.getString("token") ?? "";
    print(userTok+"\n"+userid);
    try {
      final response = await UserServiceApi().searchData(userid, userTok);
      if (response != null && mounted) {
        setState(() {
          // Assuming response is a list of users, taking the first user's data for the profile
          userProfile = response.isNotEmpty ? Map<String, dynamic>.from(response.first) : null;
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: userProfile == null ? Center(child: Text("No user profile data available.")) : ListView(
          children: [
            Card(
              child: ListTile(
                title: Text("Name: ${userProfile!['name']}"),
                subtitle: Text("Place: ${userProfile!['place']}\nAge: ${userProfile!['age']}\nHeight: ${userProfile!['height']}\nWeight: ${userProfile!['weight']}"
                    "\nBlood Group: ${userProfile!['bloodGroup']}\nEmail: ${userProfile!['email']}\nRegistered Date: ${userProfile!['registerDate']}"
                    "\nPackage Name: ${userProfile!['package_name']}\nPackage Amount: ${userProfile!['package_amount']}\nDue Amount: ${userProfile!['dueAmount']}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

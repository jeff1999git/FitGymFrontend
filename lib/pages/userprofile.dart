import 'dart:async';

import 'package:fitgym/models/userModel.dart';
import 'package:fitgym/services/userService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override

  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Future<List<Users>> ?data;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    data=UserServiceApi().getProfile();
    SharedPreferences prefered=SharedPreferences.getInstance();
    String userName=prefered.getString("name")??"";
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: FutureBuilder(
          future: data,
          builder: (context,snapshot)
          {
            if(snapshot.hasData)
              {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                    itemBuilder: (value,index)
                    {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text(snapshot.data![index].name),
                              subtitle: Text(snapshot.data![index].email),
                            )
                          ],
                        ),
                      );
                    }
                );
              }
            else
              {
                return CircularProgressIndicator();
              }
          }
      ),
    );
  }
}

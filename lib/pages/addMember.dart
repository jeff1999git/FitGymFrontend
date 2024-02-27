import 'package:flutter/material.dart';

class addMember extends StatefulWidget {
  const addMember({super.key});

  @override
  State<addMember> createState() => _addMemberState();
}

class _addMemberState extends State<addMember> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Add Member",style: TextStyle(color: Colors.white),),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [

          ],
        ),
      ),
    );
  }
}

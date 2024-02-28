import 'package:flutter/material.dart';

class viewMember extends StatefulWidget {
  const viewMember({super.key});

  @override
  State<viewMember> createState() => _viewMemberState();
}

class _viewMemberState extends State<viewMember> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(style: IconButton.styleFrom(
              foregroundColor: Colors.white
          ),
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          title: Text("Members",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

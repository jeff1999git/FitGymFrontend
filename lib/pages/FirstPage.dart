
import 'package:fitgym/pages/Package/addPackage.dart';
import 'package:fitgym/pages/admin.dart';
import 'package:fitgym/pages/userlogin.dart';
import 'package:flutter/material.dart';

import 'Package/changePackage.dart';
import 'addMember.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitGym'),
      ),
      drawer: Drawer(

        child: ListView(
          children: [
            ElevatedButton(onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder:(context)=>ChangePackage()));
            }, child: Text("User Login")),
            ElevatedButton(onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMember()));
            }, child: Text("Trainer Login")),
            ElevatedButton(onPressed: (){
             //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPackage()));
            }, child: Text("Admin Login"))
          ],
        )
      ),
      body: Container(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}

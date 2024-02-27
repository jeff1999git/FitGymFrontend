import 'package:fitgym/pages/adminMenu.dart';
import 'package:flutter/material.dart';

class adminPage extends StatefulWidget {
  const adminPage({super.key});

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(style: IconButton.styleFrom(
            foregroundColor: Colors.white
          ),
              onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)) ,
          backgroundColor: Colors.blue,
        ),
        body:
        ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "username",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "password",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
                onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>menuPage()));
                }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}

import 'package:fitgym/pages/adminMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class adminPage extends StatefulWidget {
  const adminPage({super.key});

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  String getUser="",getPass="";
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            SvgPicture.asset("assets/login.svg",height: 200,width: 200,),
            TextField(
              controller: user,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
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
              if(user.text=="gymadmin" && pass.text=="fitgym"){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>menuPage()));
              }
                }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}

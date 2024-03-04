import 'package:fitgym/pages/userMenu.dart';
import 'package:fitgym/services/userService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberLogin extends StatefulWidget {
  const MemberLogin({super.key});

  @override
  State<MemberLogin> createState() => _MemberLoginState();
}

class _MemberLoginState extends State<MemberLogin> {
  final TextEditingController username=new TextEditingController();
  final TextEditingController password=new TextEditingController();

  @override
  void checkCredentials() async
  {
    final response=await UserServiceApi().signInData(username.text, password.text);
    if(response["status"]=="success")
    {
      SharedPreferences.setMockInitialValues({});
      String userName=response["userdata"]["email"].toString();
      SharedPreferences prefer=await SharedPreferences.getInstance();
      prefer.setString("email", userName);
      print("Successful Login");
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>MemPage()
      ));
    }
    else if(response["status"]=="incorrect email id")
    {
      print("Incorrect Email_ID");

    }
    else if(response["status"]=="incorrect password")
    {
      print("Incorrect password");
    }
    else
    {
      print("Invalid");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("USER LOGIN",style: TextStyle(color: Colors.black),),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.black38,
                    Colors.white,
                    Colors.black38
                  ]
              )
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: username,
                decoration: InputDecoration(
                    labelText: "Email Id",
                    hintText: "Email Id",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: checkCredentials, child: Text("LOGIN")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("BACK"))
            ],
          ),
        ),
      ),
    );
  }
}
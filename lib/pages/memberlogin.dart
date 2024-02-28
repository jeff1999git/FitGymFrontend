import 'package:flutter/material.dart';
class MemberLogin extends StatelessWidget {
  const MemberLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MEMBER LOGIN",style: TextStyle(color: Colors.black),),
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
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){}, child: Text("LOGIN"))
            ],
          ),
        ),
      ),
    );
  }
}
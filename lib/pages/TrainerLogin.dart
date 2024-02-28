import 'package:fitgym/pages/TrainerPage.dart';
import 'package:flutter/material.dart';

class TrainerLogin extends StatefulWidget {
  const TrainerLogin({super.key});

  @override
  State<TrainerLogin> createState() => _TrainerLoginState();
}

class _TrainerLoginState extends State<TrainerLogin> {

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage("https://aadityabarve.com/wp-content/uploads/2013/09/personal-training.jpg"),
                ),
                SizedBox(height: 30,),
                TextField(
                  controller: username,
                  decoration: InputDecoration(labelText: "ENTER USERNAME",hintText:"USERNAME",
                  border: OutlineInputBorder()),
                ),
                SizedBox(height: 30,),
                TextField(
                  controller: password,
                  decoration: InputDecoration(labelText: "ENTER PASSWORD",hintText:"PASSWORD",
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 30,),
                SizedBox(child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    )
                  ),
                    onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TrainerPage()));
                    }, child: Text("LOGIN")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

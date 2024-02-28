import 'package:fitgym/pages/TrainerPage.dart';
import 'package:fitgym/services/TrainerService.dart';
import 'package:flutter/material.dart';

class TrainerLogin extends StatefulWidget {
  const TrainerLogin({super.key});

  @override
  State<TrainerLogin> createState() => _TrainerLoginState();
}

class _TrainerLoginState extends State<TrainerLogin> {
  TextEditingController username=new TextEditingController();
  TextEditingController password=new TextEditingController();
  @override
  // void signin() async
  // {
  //   final response=await Trainer().TrainerLogin(
  //     username.text,
  //     password.text);
  //       if(response["status"]=="success")
  //         {
  //           Navigator.push(context, MaterialPageRoute(builder: (context)=>TrainerPage()));
  //           // String userid=response["userdata"]["_id"].toString();
  //           // Sha.setMockInitialValues({});
  //           // SharedPreferences preferences=await SharedPreferences.getInstance();
  //           // preferences.setString("userId", userid);
  //           // print("successfull login"+userid);
  //
  //         }
  //       else if(response["status"]=="no user")
  //         {
  //
  //         }
  //       else {
  //
  //       }
  //
  // }
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
                  decoration: InputDecoration(labelText: "ENTER USERNAME",hintText:"USERNAME",
                  border: OutlineInputBorder()),
                ),
                SizedBox(height: 30,),
                TextField(
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

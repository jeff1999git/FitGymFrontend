import 'package:fitgym/services/trainerService.dart';
import 'package:flutter/material.dart';

class addTrainer extends StatefulWidget {
  const addTrainer({super.key});

  @override
  State<addTrainer> createState() => _addTrainerState();
}

class _addTrainerState extends State<addTrainer> {
  String getName="",getAge="",getEmail="",getPassword="";
  TextEditingController name=new TextEditingController();
  TextEditingController age=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  void SendValuesToApi()async{
    getName=name.text.toString();
    getAge=age.text.toString();
    getEmail=email.text.toString();
    getPassword=pass.text.toString();
    final response=await TrainerApiService().sendData(
        getName,
        getAge,
        getEmail,
        getPassword);
    if(response["status"]== "success"){
      print("Successfully added");
    }
    else{
      print("Error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Add Trainer",style: TextStyle(color: Colors.white),),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: age,
              decoration: InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: pass,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 50,
              width: 200,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
                  onPressed:SendValuesToApi,
                  child: Text("Submit")),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 50,
              width: 200,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
                  onPressed: (){
                Navigator.pop(context);
                  }, child: Text("Back")),
            )
          ],
        ),
      ),
    );
  }
}


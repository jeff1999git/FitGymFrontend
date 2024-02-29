import 'package:flutter/material.dart';

class addTrainer extends StatefulWidget {
  const addTrainer({super.key});

  @override
  State<addTrainer> createState() => _addTrainerState();
}

class _addTrainerState extends State<addTrainer> {
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
              decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
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
                  onPressed: (){}, child: Text("Submit")),
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


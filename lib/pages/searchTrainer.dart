import 'package:flutter/material.dart';

class searchTrainer extends StatefulWidget {
  const searchTrainer({super.key});

  @override
  State<searchTrainer> createState() => _searchTrainerState();
}

class _searchTrainerState extends State<searchTrainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.blue,
          title: Text("Search Trainer",style: TextStyle(color: Colors.white),),
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
                  }, child: Text("Search"))
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fitgym/pages/addTrainer.dart';
import 'package:fitgym/pages/searchTrainer.dart';
import 'package:fitgym/pages/viewTrainer.dart';
import 'package:flutter/material.dart';

class trainerMenuPage extends StatefulWidget {
  const trainerMenuPage({super.key});

  @override
  State<trainerMenuPage> createState() => _trainerMenuPageState();
}

class _trainerMenuPageState extends State<trainerMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>addTrainer()));
                }, child: Text("Add Trainer")),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewTrainer()));
                }, child: Text("View Trainers")),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>searchTrainer()));
                }, child: Text("Search Trainer")),
          )
        ],
      ),
    );
  }
}

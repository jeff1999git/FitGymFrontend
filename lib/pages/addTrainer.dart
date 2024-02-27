import 'package:flutter/material.dart';

class addTrainer extends StatefulWidget {
  const addTrainer({super.key});

  @override
  State<addTrainer> createState() => _addTrainerState();
}

class _addTrainerState extends State<addTrainer> {
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
                    onPressed: (){}, child: Text("Add Trainer")),
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
                    onPressed: (){}, child: Text("View Trainers")),
              )
          ],),
    );
  }
}

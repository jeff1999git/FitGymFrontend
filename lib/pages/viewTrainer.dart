import 'package:flutter/material.dart';

class viewTrainer extends StatefulWidget {
  const viewTrainer({super.key});

  @override
  State<viewTrainer> createState() => _viewTrainerState();
}

class _viewTrainerState extends State<viewTrainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(style: IconButton.styleFrom(
            foregroundColor: Colors.white
          ),
              onPressed: (){
            Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          title: Text("Trainers",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

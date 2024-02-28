import 'package:fitgym/pages/ViewAttendence.dart';
import 'package:flutter/material.dart';

class TrainerPage extends StatelessWidget {
  const TrainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage("https://www.shutterstock.com/image-vector/default-placeholder-fitness-trainer-tshirt-260nw-1064798141.jpg"),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))
                    ),
                      onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAttendence()));
                      }, child:Text("VIEW ATTENDENCE"))),
                  SizedBox(height: 30,),
                  SizedBox(child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                      onPressed: (){}, child: Text("MARK ATTENDENCE")))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

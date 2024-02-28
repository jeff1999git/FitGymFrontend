import 'package:flutter/material.dart';

class ViewAttendence extends StatefulWidget {
  const ViewAttendence({super.key});

  @override
  State<ViewAttendence> createState() => _ViewAttendenceState();
}

class _ViewAttendenceState extends State<ViewAttendence> {
  DateTime Date=DateTime.now();
  void ShowDatePicker()
  {
    showDatePicker(
        context:context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030)
    ).then((value){
      setState(() {
        Date=value!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Scaffold(
        body:Center(
          child: Container(

            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //display chosen date
                Text(Date.toString(),style: TextStyle(fontSize: 30),),
                SizedBox(height: 30,),
                SizedBox(child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.blueGrey,
                     foregroundColor: Colors.white,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(6)
                     )
                   ),
                    onPressed:ShowDatePicker, child: Text("SELECT DATE")))
              ],
            ),
          ),
        )
      ),
    );
  }
}

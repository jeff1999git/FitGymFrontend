import 'package:fitgym/pages/addMember.dart';
import 'package:fitgym/pages/deleteMember.dart';
import 'package:fitgym/pages/searchMember.dart';
import 'package:fitgym/pages/viewMember.dart';
import 'package:flutter/material.dart';

class memberMenu extends StatefulWidget {
  const memberMenu({super.key});

  @override
  State<memberMenu> createState() => _memberMenuState();
}

class _memberMenuState extends State<memberMenu> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(height: 50,
              width: 200,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMember()));
                  }, child: Text("Add Member")),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 50,
              width: 200,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>searchMember()));
                  }, child: Text("Search Member")),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 50,
              width: 200,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>deleteMember()));
                  }, child: Text("Delete Member")),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 50,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>viewMember()));
                  }, child: Text("View Members")),
            ),
          ],),
    );
  }
}

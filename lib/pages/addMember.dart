import 'package:flutter/material.dart';

class addMember extends StatefulWidget {
  const addMember({super.key});

  @override
  State<addMember> createState() => _addMemberState();
}

class _addMemberState extends State<addMember> {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
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
                    onPressed: (){}, child: Text("Add Member")),
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
                    onPressed: (){}, child: Text("Search Member")),
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
                    onPressed: (){}, child: Text("Delete Member")),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                    onPressed: (){}, child: Text("View Members")),
              ),
              SizedBox(height: 10,),

            ],
          ),
    );
  }
}

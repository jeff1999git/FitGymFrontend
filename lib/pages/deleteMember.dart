import 'package:flutter/material.dart';

class deleteMember extends StatefulWidget {
  const deleteMember({super.key});

  @override
  State<deleteMember> createState() => _deleteMemberState();
}

class _deleteMemberState extends State<deleteMember> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(style: IconButton.styleFrom(
              foregroundColor: Colors.white
          ),
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.blue,
          title: Text("Delete Member",style: TextStyle(color: Colors.white),),
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
                    }, child: Text("Delete"))
            ),
          ],
        ),
      ),
    );
  }
}

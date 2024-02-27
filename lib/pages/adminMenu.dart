import 'package:fitgym/pages/addMember.dart';
import 'package:fitgym/pages/addTrainer.dart';
import 'package:fitgym/pages/trainerMenu.dart';
import 'package:fitgym/pages/updatePackage.dart';
import 'package:flutter/material.dart';

class menuPage extends StatefulWidget {
  const menuPage({super.key});

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  final List<Widget>pages=[
    trainerMenuPage(),
    addMember(),
    updatePackage()
  ];
  int currentIndex=0;
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
      ),
        body:pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            print(index);
            setState(() {
              currentIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add),
            label: "Add Trainer"),
            BottomNavigationBarItem(icon: Icon(Icons.add),
            label: "Add Member"),
            BottomNavigationBarItem(icon: Icon(Icons.update),
            label: "Update Package")
          ],
        ),
    )
    );
  }
}

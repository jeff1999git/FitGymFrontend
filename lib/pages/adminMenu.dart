import 'package:fitgym/pages/memberMenu.dart';
import 'package:fitgym/pages/trainerMenu.dart';
import 'package:flutter/material.dart';
import 'Package/updatePackage.dart';

class menuPage extends StatefulWidget {
  const menuPage({super.key});

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  final List<Widget>pages=[
    trainerMenuPage(),
    memberMenu(),
    updatePackage()
  ];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        leading: IconButton(style: IconButton.styleFrom(
          foregroundColor: Colors.white
        ),
            onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.black,
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
            BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "Trainer"),
            BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "Member"),
            BottomNavigationBarItem(icon: Icon(Icons.update),
            label: "Package")
          ],
        ),
    )
    );
  }
}

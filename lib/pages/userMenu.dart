import 'package:fitgym/pages/userpackage.dart';
import 'package:fitgym/pages/userpayment.dart';
import 'package:fitgym/pages/userprofile.dart';
import 'package:flutter/material.dart';

class MemPage extends StatefulWidget {
  const MemPage({super.key});

  @override
  State<MemPage> createState() => _MemPageState();
}

class _MemPageState extends State<MemPage> {
  final List<Widget>pages=[
    UserProfile(),
    UserPackage(),
    UserPayment()
  ];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
              icon: Icon(Icons.arrow_back_ios),color: Colors.white,),
        ),

        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){

            print(index);
            setState(() {
              currentIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded),
                label: "Package"),
            BottomNavigationBarItem(
                icon: Icon(Icons.payments_outlined),
                label: "Payment history")
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("User Login")),
            ElevatedButton(onPressed: (){}, child: Text("Trainer Login")),
            ElevatedButton(onPressed: (){}, child: Text("Admin Login"))
          ],
        )
      ),
      body: Container(),
    );
  }
}

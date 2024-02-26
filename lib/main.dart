import 'package:fitgym/pages/FirstPage.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

import 'package:flutter/material.dart';

class UserPackage extends StatefulWidget {
  const UserPackage({super.key});

  @override
  State<UserPackage> createState() => _UserPackageState();
}

class _UserPackageState extends State<UserPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Package"),
      ),
    );
  }
}

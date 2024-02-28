import 'package:flutter/material.dart';

class UserPayment extends StatefulWidget {
  const UserPayment({super.key});

  @override
  State<UserPayment> createState() => _UserPaymentState();
}

class _UserPaymentState extends State<UserPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Payment History"),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ChangePackage extends StatefulWidget {
  ChangePackage({Key? key}) : super(key: key);

  @override
  _ChangePackageState createState() => _ChangePackageState();
}

class _ChangePackageState extends State<ChangePackage> {
  late String selectedPackage; // Make sure selectedPackage is initialized

  @override
  void initState() {
    super.initState();
    selectedPackage = ''; // Initialize selectedPackage in initState
  }

  final List<String> packages = ['Package A', 'Package B', 'Package C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPDATE PACKAGE", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black38, Colors.white, Colors.black38]),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Email Id",
                hintText: "Email Id",
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Select Package:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: packages.map((String package) {
                return RadioListTile<String>(
                  title: Text(package),
                  value: package,
                  groupValue: selectedPackage,
                  onChanged: (String? value) {
                    setState(() {
                      selectedPackage = value!;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
              },
              child: Text("SUBSCRIBE"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("BACK"),
            )
          ],
        ),
      ),
    );
  }
}

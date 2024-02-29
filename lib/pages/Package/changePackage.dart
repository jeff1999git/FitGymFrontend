import 'package:flutter/material.dart';

import '../../services/updatePackageService.dart';

class ChangePackage extends StatefulWidget {
  ChangePackage({Key? key}) : super(key: key);

  @override
  _ChangePackageState createState() => _ChangePackageState();
}

class _ChangePackageState extends State<ChangePackage> {
  late updatePackageApiService _packageService;
  late List<dynamic> packages = [];
  String? packagename;
  String? packageId;
  @override
  void initState() {
    super.initState();
    _packageService = updatePackageApiService();
    _fetchPackages();
    packagename = '';
  }

  Future<void> _fetchPackages() async {
    try {
      List<dynamic> fetchedPackages = await _packageService.fetchPackages();
      setState(() {
        packages = fetchedPackages;
      });
    } catch (e) {
      print('Error fetching packages: $e');
    }
  }

  String email="";
  TextEditingController controller_1 = new TextEditingController();
  void UpdatepackageUserApi() async
  {
    email=controller_1.text;
    final response = await updatePackageApiService().UpdatePackageData(email,packagename ?? '');
    print(response["status"]);
    if(response["status"]=="success")
    {
      showSimplePopup1(context, "Package Updated!");
    }
    else
    {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPDATE PACKAGE", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        height: 1000,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black38, Colors.white, Colors.black38]),
        ),
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller_1,
              decoration: InputDecoration(
                labelText: "Email Id",
                hintText: "Email Id",
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              ),
            ),
            SizedBox(height: 10),
            Text('Select Package:'),
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(maxHeight: 200),
                width: double.infinity, // Set the width to occupy the available space
                //padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButton(
                  value: packageId,
                  items: packages.map<DropdownMenuItem<String>>((dynamic package) {
                    return DropdownMenuItem(
                      value: package['_id'],
                      child: Column(
                        children: [
                          Text('Package Name : ${package['packageName']} \n Package Amount: ${package['packageAmount']}'),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (selectedPackageId) {
                    setState(() {
                      packageId = selectedPackageId as String;
                      packagename = packages.firstWhere((package) => package['_id'] == selectedPackageId)['packageName'];
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: UpdatepackageUserApi,
              child: Text("UPDATE"),
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
  void showSimplePopup1(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(s,style: TextStyle(color: Colors.black),),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white70,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

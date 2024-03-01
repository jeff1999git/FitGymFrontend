import 'package:fitgym/services/Package/packageService.dart';
import 'package:flutter/material.dart';

class AddPackage extends StatefulWidget {
  const AddPackage({super.key});

  @override
  State<AddPackage> createState() => _AddPackageState();
}

class _AddPackageState extends State<AddPackage> {
  String packageName="";
  String packageDes="";
  String packageAmount="";
  TextEditingController controller_1 = new TextEditingController();
  TextEditingController controller_2 = new TextEditingController();
  TextEditingController controller_3 = new TextEditingController();
  void AddPackageApi() async
  {
    packageName=controller_1.text;
    packageDes=controller_2.text;
    packageAmount=controller_3.text;
    final response = await PackageApiService().AddPackageData(packageName,packageDes,packageAmount);
    print(response["status"]);
    if(response["status"]=="success")
    {
      showSimplePopup1(context, "New Package Added!");
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
        title: Text("ADD PACKAGE", style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black38, Colors.white, Colors.black38]),
          ),
          padding: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
          TextField(
            controller: controller_1,
          decoration: InputDecoration(
          labelText: "Package Name",
            hintText: "Package Name",
            border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller_2,
          decoration: InputDecoration(
            labelText: "Package Description",
            hintText: "Package Description",
            border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller_3,
          decoration: InputDecoration(
            labelText: "Package Amount",
            hintText: "Package Amount",
            border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          ),
        ),
          SizedBox(height: 50,
          width: 700),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black12,foregroundColor: Colors.white),
            onPressed: AddPackageApi,
            child: Text("ADD"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black12,foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("BACK"),
          )
            ],
            ),
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

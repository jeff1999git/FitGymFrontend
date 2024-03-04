import 'package:flutter/material.dart';
import '../services/userService.dart';

class AddMember extends StatefulWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  late UserServiceApi _packageService;
  late List<dynamic> packages = [];
  String? packageId;
  @override
  void initState() {
    super.initState();
    _packageService = UserServiceApi();
    _fetchPackages();
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

  String name="";
  String place="";
  String age="";
  String height="";
  String weight="";
  String bloodGroup="";
  String email="";
  String password="";
  TextEditingController controller_1 = new TextEditingController();
  TextEditingController controller_2 = new TextEditingController();
  TextEditingController controller_3 = new TextEditingController();
  TextEditingController controller_4 = new TextEditingController();
  TextEditingController controller_5 = new TextEditingController();
  TextEditingController controller_6 = new TextEditingController();
  TextEditingController controller_7 = new TextEditingController();
  TextEditingController controller_8 = new TextEditingController();
  void addUserApi() async
  {
    name=controller_1.text;
    place=controller_2.text;
    age=controller_3.text;
    height=controller_4.text;
    weight=controller_5.text;
    bloodGroup=controller_6.text;
    email=controller_7.text;
    password=controller_8.text;
    final response = await UserServiceApi().signUpData(name,place,age,height,weight,bloodGroup,email,password,packageId ?? '');
    print(response["status"]);
    if(response["status"]=="success")
    {
      showSimplePopup1(context, "New User Added!");
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
          title: Text("Add Member",style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
    height: 1000,
    width: double.infinity,
    padding: EdgeInsets.all(50),
          child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
          children: [
    SizedBox(height: 60),
            TextField(
              controller: controller_1,
              decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: controller_2,
              decoration: InputDecoration(
                  labelText: "Place",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: controller_3,
              decoration: InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: controller_4,
              decoration: InputDecoration(
                  labelText: "Height",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: controller_5,
              decoration: InputDecoration(
                  labelText: "Weight",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: controller_6,
              decoration: InputDecoration(
                  labelText: "Blood Group",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: controller_7,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: controller_8,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10),
            Text('Select Package:'),
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(maxHeight: 200),
                width: double.infinity, // Set the width to occupy the available space
                //padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
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
                      packageId = selectedPackageId as String; // Update the packageId
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 50,
              width: 200,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
                  onPressed: addUserApi, child: Text("Submit")),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 50,
              width: 200,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
                  onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Back")),
            ),
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

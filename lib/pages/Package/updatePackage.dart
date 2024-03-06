import 'package:fitgym/pages/Package/addPackage.dart';
import 'package:fitgym/pages/Package/changePackage.dart';
import 'package:fitgym/pages/userpackage.dart';
import 'package:flutter/material.dart';

class updatePackage extends StatefulWidget {
  const updatePackage({super.key});

  @override
  State<updatePackage> createState() => _updatePackageState();
}

class _updatePackageState extends State<updatePackage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPackage()));
                  }, child: Text("Add Package")),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePackage()));
                  }, child: Text("Update Package")),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserPackage()));
                  }, child: Text("View all Packages")),
            ),
          ],
        ),
    );
  }
}

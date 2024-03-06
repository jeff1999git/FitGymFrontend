import 'package:fitgym/models/Package/packageModel.dart';
import 'package:fitgym/services/Package/packageService.dart';
import 'package:flutter/material.dart';

class UserPackage extends StatefulWidget {
  const UserPackage({super.key});

  @override
  State<UserPackage> createState() => _UserPackageState();
}

class _UserPackageState extends State<UserPackage> {
  Future<List<Package>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = PackageApiService().getPackages();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(style: IconButton.styleFrom(
            foregroundColor: Colors.white
        ),
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
        title: Text("Packages",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: 1000,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: FutureBuilder(future: data, builder: (context,snapshot)
        {
          if(snapshot.hasData && snapshot.data!.isNotEmpty)
          {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (value,index)
                {
                  return SingleChildScrollView(
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            title: Text("Package Name: "+snapshot.data![index].packageName.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            subtitle: Text("Package Description: "+snapshot.data![index].packageDes.toString()+ "\n" +"Package Amount: "+snapshot.data![index].packageAmount.toString()),
                            leading: CircleAvatar(
                              child: Text(snapshot.data![index].packageName[0]),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          else
          {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}

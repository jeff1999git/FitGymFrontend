import 'package:flutter/material.dart';
import '../models/userViewModel.dart';
import '../services/memberViewService.dart';
import '../services/userService.dart';

class deleteMember extends StatefulWidget {
  const deleteMember({super.key});

  @override
  State<deleteMember> createState() => _deleteMemberState();
}

class _deleteMemberState extends State<deleteMember> {
  Future<List<Viewws >> ? data;

  @override
  void initState() {
    super.initState();
    data = MemberViewApiService().getViews(); // Modified to include user IDs
  }

  void deleteUserApi(String id) async {
    final response = await UserServiceApi().deleteData(id);
    if (response["status"] == "success") {
      showSimplePopup1(context, "User Deleted!");
      setState(() {
        data = MemberViewApiService().getViews(); // Refresh user data after deletion
      });
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(style: IconButton.styleFrom(
              foregroundColor: Colors.white
          ),
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          title: Text("Delete Members",style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          height: 1000,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: FutureBuilder(future: data, builder: (context,snapshot)
          {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No users found.'));
            } else {
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
                              title: Text("Name: "+snapshot.data![index].name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              subtitle: Text("Email: "+snapshot.data![index].email.toString()+ "\n" +"Package Name: "+snapshot.data![index].packageName.toString()+ "\n" +"Due Amount: "+snapshot.data![index].dueAmount.toString()+ "\n" +"Remaining Days For Due: "+snapshot.data![index].remainingDaysForNextDue.toString()),
                              leading: CircleAvatar(
                                child: Text(snapshot.data![index].name[0]),
                              ),
                              trailing: ElevatedButton(style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),
                                  onPressed: ()
                                  {
                                    deleteUserApi(snapshot.data![index].id);
                                  } ,
                                  child: Text("Delete")),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
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
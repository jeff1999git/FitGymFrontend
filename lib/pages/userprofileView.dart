import 'package:fitgym/models/trainerModel.dart';
import 'package:fitgym/models/userModel.dart';
import 'package:fitgym/services/trainerService.dart';
import 'package:fitgym/services/userService.dart';
import 'package:flutter/material.dart';

class Uprofileview extends StatefulWidget {
  const Uprofileview({super.key});

  @override
  State<Uprofileview> createState() => _UprofileviewState();
}

class _UprofileviewState extends State<Uprofileview> {
  Future<List<Users>>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=UserServiceApi().getProfile();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(style: IconButton.styleFrom(
              foregroundColor: Colors.white
          ),
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          title: Text("Profile",style: TextStyle(color: Colors.white),),
        ),
        body: FutureBuilder(future: data, builder: (context,snapshot){
          if(snapshot.hasData && snapshot.data!.isNotEmpty){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return Card(
                    color: Colors.lightBlue.shade100,
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(snapshot.data![index].name[0]),
                            backgroundColor: Colors.lightBlue.shade300,
                          ),
                          title: Text("Name : "+snapshot.data![index].name.toString()),
                          subtitle: Text("Age : "+snapshot.data![index].age.toString()+
                  "\nPlace : "+snapshot.data![index].place.toString()+
                  "\nWeight : "+snapshot.data![index].weight.toString()+"\nBloodGroup : "+snapshot.data![index].bloodGroup.toString()+
                              "\nEmail : "+snapshot.data![index].email.toString()+
                              "\nRegister Date : "+snapshot.data![index].registerDate.toString()+
                              "\nHeight : "+snapshot.data![index].height.toString()),
                        )
                      ],
                    ),
                  );
                });
          }
          else{
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}

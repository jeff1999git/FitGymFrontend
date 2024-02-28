import 'package:fitgym/models/trainerModel.dart';
import 'package:fitgym/services/trainerService.dart';
import 'package:flutter/material.dart';

class viewTrainer extends StatefulWidget {
  const viewTrainer({super.key});

  @override
  State<viewTrainer> createState() => _viewTrainerState();
}

class _viewTrainerState extends State<viewTrainer> {
  Future<List<Trainer>>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=TrainerApiService().getTrainer();
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
          title: Text("Trainers",style: TextStyle(color: Colors.white),),
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
                      "\nEmail : "+snapshot.data![index].emailid.toString()),
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

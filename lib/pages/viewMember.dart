import 'package:flutter/material.dart';
import '../models/userViewModel.dart';
import '../services/memberViewService.dart';

class viewMember extends StatefulWidget {
  const viewMember({super.key});

  @override
  State<viewMember> createState() => _viewMemberState();
}

class _viewMemberState extends State<viewMember> {
  Future<List<Viewws >> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = MemberViewApiService().getViews();
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
          title: Text("Members",style: TextStyle(color: Colors.white),),
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
                            title: Text("Name: "+snapshot.data![index].name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            subtitle: Text("Email: "+snapshot.data![index].email.toString()+ "\n" +"Package Name: "+snapshot.data![index].packageName.toString()+ "\n" +"Due Amount: "+snapshot.data![index].dueAmount.toString()+ "\n" +"Remaining Days For Due: "+snapshot.data![index].remainingDaysForNextDue.toString()),
                            leading: CircleAvatar(
                              child: Text(snapshot.data![index].name[0]),
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

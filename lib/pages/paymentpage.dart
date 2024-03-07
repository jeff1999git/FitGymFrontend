import 'package:fitgym/models/transactionModel.dart';
import 'package:fitgym/services/transactionService.dart';
import 'package:flutter/material.dart';
import '../models/userViewModel.dart';
import '../services/memberViewService.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  Future<List<Payment >> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = PaymentApiService().viewTransaction();
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
        title: Text("Transaction",style: TextStyle(color: Colors.white),),
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
                            //title: Text("Name: "+snapshot.data![index].p.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            //subtitle: Text("Email: "+snapshot.data![index].email.toString()+ "\n" +"Package Name: "+snapshot.data![index].packageName.toString()+ "\n" +"Due Amount: "+snapshot.data![index].dueAmount.toString()+ "\n" +"Remaining Days For Due: "+snapshot.data![index].remainingDaysForNextDue.toString()),
                            leading: CircleAvatar(
                             // child: Text(snapshot.data![index].name[0]),
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

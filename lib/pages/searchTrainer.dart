import 'package:fitgym/services/trainerService.dart';
import 'package:flutter/material.dart';

class searchTrainer extends StatefulWidget {
  const searchTrainer({super.key});

  @override
  State<searchTrainer> createState() => _searchTrainerState();
}

class _searchTrainerState extends State<searchTrainer> {
  TextEditingController email=new TextEditingController();
  List<Map<String,dynamic>>searchResult=[];

  void searchTrainer()async{
    final response=await TrainerApiService().searchTrainer(email.text);
    setState(() {
      print(response);
      searchResult=List<Map<String,dynamic>>.from(response);
    });
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(style: IconButton.styleFrom(
              foregroundColor: Colors.white
          ),
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.blue,
          title: Text("Search Trainer",style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child:
            Column(
              children: [
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    suffixIcon:Icon(Icons.search)
                  ),
                ),
            SizedBox(height: 10,),
            SizedBox(height: 50,
              width: 200,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
                  onPressed: searchTrainer, child: Text("Search"))
            ),
            SizedBox(height:10),
            Expanded(child: ListView.builder(
              itemCount: searchResult.length,
                itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text("Name : ${searchResult[index]['name']}"),
                    subtitle: Text("Age : ${searchResult[index]['age']}"+
                    "\nEmail : ${searchResult[index]['emailid']}"),
                  ),
                );
                }))
          ],
        ),
      ),
      ),
    );
  }
}

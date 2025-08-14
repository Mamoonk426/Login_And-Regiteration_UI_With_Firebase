import 'dart:math';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui_with_firebase/Screens/Login_Screen.dart';
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Datascreen extends StatefulWidget {
   Datascreen({super.key , required this.name});
String name ;
  @override
  State<Datascreen> createState() => _DatascreenState();
}
class _DatascreenState extends State<Datascreen> {
  TextEditingController updateController = TextEditingController() ;
  void logout()async{
    var logout =  await FirebaseAuth.instance.signOut() ;
  }
  var ref = FirebaseDatabase.instance.ref('Users') ;
  void _showmydialog(String email , String name){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Update'),
        content: TextFormField(
          controller: updateController,
          decoration: InputDecoration(
            labelText: 'Update Your Name' ,
          ),
        ),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel')) ,
          ElevatedButton(onPressed: (){
            update() ;
            Navigator.pop(context)  ;
          }, child: Text('Save'))
        ],
      ) ;
    }) ;

  }
  void update()async{
    var uid = FirebaseAuth.instance.currentUser!.uid.toString() ;
    var ref = await FirebaseDatabase.instance.ref('Users/$uid') ;
    await ref.update({
      'Name' : updateController.text.toString(),
    }) ;
  }
  void delete()async{
    var uid = FirebaseAuth.instance.currentUser!.uid ;
    var ref =FirebaseDatabase.instance.ref('Users/$uid') ;
    await ref.remove() ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
           logout() ;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
          }, icon:Icon(Icons.logout))
        ],
        backgroundColor: Colors.blue,
        title: Text('User Regestired So Far',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20) ,
                  ),
                    child: Row(children:[ Text('Welcome',style: TextStyle(fontSize: 25,color: Colors.white),
                    ) ,
                      SizedBox(width: 4,) ,
                      Expanded(child: Text(widget.name ,style: TextStyle(color: Colors.grey ,fontSize: 30),))
          ] )
          ),
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                      height: 55 ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10) ,
                        color: Colors.blue ,
                      ),
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('UserInfo',style: TextStyle(color: Colors.white),) ,
                          Text('Toggle' ,style: TextStyle(color: Colors.white),)
                        ],
                      ),
                                      ),
                ),
          ),
          Expanded(
            flex: 3,
            child: FirebaseAnimatedList(query: ref,
                itemBuilder: (context,snapshot,index,animations){
              final record = Map<String ,dynamic>.from(snapshot.value as Map) ;
              print(record);
              print(record['Email']);
              var list = record.values.toList() ;
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.blue,
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text(record['Name']?? '',style: TextStyle(color: Colors.white),),
                      subtitle: Text(record['Email' ] ?? '',style: TextStyle(color: Colors.white),),
                      trailing: PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (context)=>[
                        PopupMenuItem(
                            child: Container(
                      child: Column(
                      children: [
                              ListTile(
                          onTap:() {
                            Navigator.pop(context) ;
                   _showmydialog(record['Email']??'', record['Name']??'') ;
                    },
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ) ,
                              SizedBox(height: 7,),
                              ListTile(
                                onTap: (){
                       delete() ;
                                },
                                leading: Icon(Icons.delete ,color: Colors.red,),
                                title: Text('Delete'),
                              )
                                                        ],
                      )
                            ),
                            )
                     ]
                    ),
                  ),
              )
              );
                })
    )
    ]
    )
    );
  }
}

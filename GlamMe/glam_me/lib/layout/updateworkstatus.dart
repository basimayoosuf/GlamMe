import 'package:flutter/material.dart';
class updateworkstatus extends StatefulWidget {
  const updateworkstatus({Key? key}) : super(key: key);

  @override
  State<updateworkstatus> createState() => _updateworkstatusState();
}

class _updateworkstatusState extends State<updateworkstatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Update Work Status', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [

              

            ],) ),
        ),
      ),   
    );

  }
}
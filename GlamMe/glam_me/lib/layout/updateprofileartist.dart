import 'package:flutter/material.dart';
class updateprofileartist extends StatefulWidget {
  const updateprofileartist({Key? key}) : super(key: key);

  @override
  State<updateprofileartist> createState() => _updateprofileartistState();
}

class _updateprofileartistState extends State<updateprofileartist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Update profile', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
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
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavuser.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/login.dart';
import 'package:glam_me/layout/suggestion.dart';
import 'package:http/http.dart';
class bookservices extends StatefulWidget {
  const bookservices({Key? key}) : super(key: key);

  @override
  State<bookservices> createState() => _bookservicesState();
  static String sid= "";
  static String amount= "";

}

class _bookservicesState extends State<bookservices> {
  late TextEditingController date,time,amt,suggestion;
   @override
  void initState(){
    date=TextEditingController();
    time=TextEditingController();
    amt=TextEditingController();
    amt.text=bookservices.amount;
    suggestion=TextEditingController();
    super.initState();
  }
   void postdata()async{
    var url=Uri.parse(login.url+"booking/%20booking/");
    var resp=await post(url,body:{
      'date':date.text.toString(),
      'time':time.text.toString(),
      'uid':login.uid,
      'sid':bookservices.sid,
      'amount': amt.text.toString(),
      'suggestion':suggestion.text.toString()
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw_user(),
      bottomNavigationBar: botnav_user(),
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Book services', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: amt,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    hintText: 'Amount',
                    prefixIcon: Icon(Icons.currency_rupee),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
             Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: date,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'date',
                    prefixIcon: Icon(Icons.date_range_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              
               Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: time,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    hintText: 'time',
                    prefixIcon: Icon(Icons.timelapse),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: suggestion,
                  decoration: InputDecoration(
                    labelText: 'Suggestion',
                    hintText: 'suggestion',
                    prefixIcon: Icon(Icons.note_add),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                child: ElevatedButton(
                  onPressed: () {
                    postdata();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context)=> bookservices()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(223, 26, 158, 163),
                  ),
                  child: Text("Book"),
                ),
              ),

              

            ],) ),
        ),
      ),   
    );

  }
}
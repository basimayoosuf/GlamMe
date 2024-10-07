import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class addoffer extends StatefulWidget {
  const addoffer({Key? key}) : super(key: key);

  @override
  State<addoffer> createState() => _addofferState();
}

class _addofferState extends State<addoffer> {
  late TextEditingController offer,offerdate;
  @override
  void initState(){
    offer=TextEditingController();
    offerdate=TextEditingController();
    super.initState();
  }
  void postdata()async{
    String url="";
    var resp=await post(url,body:{
      'offer':offer.text.toString(),
      'offerdate':offerdate.text.toString(),

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add offer', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Offer',
                    hintText: 'offer',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Offerdate',
                    hintText: 'offerdate',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
               Container(
                padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context)=> addoffer()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(223, 26, 158, 163),
                  ),
                  child: Text("Submit"),
                ),
              ),
              

            ],) ),
        ),
      ), 
      
      );
    
  }
}
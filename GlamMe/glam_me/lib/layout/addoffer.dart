
import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavartist.dart';
import 'package:glam_me/layout/draw_artist.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
class addoffer extends StatefulWidget {
  const addoffer({Key? key}) : super(key: key);

  @override
  State<addoffer> createState() => _addofferState();
  
}

class _addofferState extends State<addoffer> {
  late TextEditingController offer,offerdate,service;
  @override
  void initState(){
    offer=TextEditingController();
    offerdate=TextEditingController();
    service=TextEditingController();
    super.initState();
  }
  void postdata()async{
     var url=Uri.parse(login.url+"offer/offer/");
    var resp=await post(url,body:{
      'offer':offer.text.toString(),
      'offerdate':offerdate.text.toString(),
      'ser':service.text.toString(),
      'aid':login.uid,


    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw_artist(),
      bottomNavigationBar: botnav_artist(),
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add offer', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: service,
                  decoration: InputDecoration(
                    labelText: 'Service',
                    hintText: 'service',
                    prefixIcon: Icon(Icons.details),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),


              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: offer,
                  decoration: InputDecoration(
                    labelText: 'Offer',
                    hintText: 'offer',
                    prefixIcon: Icon(Icons.local_offer),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: offerdate,
                  decoration: InputDecoration(
                    labelText: 'Offerdate',
                    hintText: 'offerdate',
                    prefixIcon: Icon(Icons.date_range),
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
                      builder: (BuildContext context)=> addoffer()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(223, 26, 158, 163),
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
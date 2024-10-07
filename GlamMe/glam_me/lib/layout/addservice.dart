import 'package:flutter/material.dart';
import 'package:http/http.dart';
class addservice extends StatefulWidget {
  const addservice({Key? key}) : super(key: key);

  @override
  State<addservice> createState() => _addserviceState();
}

class _addserviceState extends State<addservice> {
  late TextEditingController service;
  @override
  void initState(){
    service=TextEditingController();
    super.initState();
  }
   void postdata()async{
    String url="";
    var resp=await post(url,body:{
      'service':service.text.toString(),
      
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add Service', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Service',
                    hintText: 'service',
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
                      builder: (BuildContext context)=> addservice()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(223, 26, 158, 163),
                  ),
                  child: Text("Add"),
                ),
              ),

            ],) ),
        ),
      ),   
    );

  }
}
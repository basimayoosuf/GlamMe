import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavartist.dart';
import 'package:glam_me/layout/draw_artist.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
class addservice extends StatefulWidget {
  const addservice({Key? key}) : super(key: key);

  @override
  State<addservice> createState() => _addserviceState();
}

class _addserviceState extends State<addservice> {
  List dropList =[
    {"service_id":0, "service": "<Select>"},
    // {"edpt_id":1, "name": "<two>"},
  ];
  var fkey=GlobalKey<FormState>();
  var val=true;
  var dropdownValue = "";
  // late TextEditingController details,type,fee;
  void gendrop() async {
    var url = Uri.parse(login.url+"service/serv_view/");

    var resp = await get(url);
    print(resp.body);
    setState(() {
      dropList = jsonDecode(resp.body);
    });
  }
  late TextEditingController service,description,rate;
  @override
  void initState(){
    service=TextEditingController();
    description=TextEditingController();
    rate=TextEditingController();
    super.initState();
    gendrop();
  }
   void postdata()async{
     var url=Uri.parse(login.url+"service/xyz/");
    var resp=await post(url,body:{
      'ser':service.text.toString(),
      'description':description.text.toString(),
      'rate':rate.text.toString(),
      'uid':login.uid,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw_artist(),
      bottomNavigationBar: botnav_artist(),
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add Service', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
      //         Container(
      //           padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
      //           child: TextFormField(
      //             controller: service,
      //             decoration: InputDecoration(
      //               labelText: 'Service',
      //               hintText: 'service',
      //               prefixIcon: Icon(Icons.note),
      //               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      //             ),
      //           ),
      //         ),
//       Container( //dropdown
//                           padding: EdgeInsets.fromLTRB(20, 0, 20, 20), //3rd



//                           // width: 350.0,
//                           decoration: BoxDecoration(
//                               // borderRadius: BorderRadius.circular(20),
//                               // border: Border.all(color: Colors.black)
//                           ),

//                           child: DropdownButtonFormField(
//                               hint: Text("select the Service"),
//                               onChanged: ( newValue) {
//                                 setState(() {
//                                   dropdownValue = newValue.toString();
//                                   print(dropdownValue);
//                                 });
//                               },
//                               items: dropList.map((item) => DropdownMenuItem(child: Text(item['service'].toString()),value:item['service_id'].toString(),)).toList()
//                           )

//                       ),
      Container( //dropdown
    padding: EdgeInsets.fromLTRB(90, 10, 90, 10), //3rd
    width: 350.0,
    
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black)
    ),

    child: DropdownButtonFormField(
        hint: Text("<select Service>"),
        onChanged: ( newValue) {
          setState(() {
            dropdownValue = newValue.toString();
            print(dropdownValue);
          });
        },
        items: dropList.map((item) => DropdownMenuItem(child: Text(item['service'].toString()),value:item['service_id'].toString(),)).toList()
    )
),        
Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: description,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'description',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: rate,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    hintText: 'Amount',
                    prefixIcon: Icon(Icons.currency_rupee),
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
                      builder: (BuildContext context)=> addservice()));
                    
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
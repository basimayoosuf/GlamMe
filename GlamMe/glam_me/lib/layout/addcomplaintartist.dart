import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavartist.dart';
import 'package:glam_me/layout/draw_artist.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
class addcomplaintartist extends StatefulWidget {
  const addcomplaintartist({Key? key}) : super(key: key);

  @override
  State<addcomplaintartist> createState() => _addcomplaintartistState();
  static String cid="";
}

class _addcomplaintartistState extends State<addcomplaintartist> {
  late TextEditingController complaint;
  @override
  void initState(){
    complaint=TextEditingController();
    super.initState();
  }
  void postdata()async{

    var url=Uri.parse(login.url+"artist_complaint/%20artistcmplt/");
    var resp=await post(url,body:{
      'complaint':complaint.text.toString(),
      'cid':addcomplaintartist.cid,
      'uid':login.uid,

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw_artist(),
      bottomNavigationBar: botnav_artist(),
    appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add complaint', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      iconTheme: IconThemeData(color: Colors.white),
      ),  
      body: Container(
        

        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: complaint,
                  decoration: InputDecoration(
                    labelText: 'Complaint',
                    hintText: 'complaint',
                    prefixIcon: Icon(Icons.note_alt_rounded),
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
                      builder: (BuildContext context)=> addcomplaintartist()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(223, 26, 158, 163),
                  ),
                  child: Text("Post"),
                ),
              ),


              




            ],
            ),
            ),
        ),
      ),   
    );
    
  }
}
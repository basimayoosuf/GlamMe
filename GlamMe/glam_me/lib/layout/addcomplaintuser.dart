import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavuser.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
class addcomplaintuser extends StatefulWidget {
  const addcomplaintuser({Key? key}) : super(key: key);

  @override
  State<addcomplaintuser> createState() => _addcomplaintuserState();
  static var cid = "";
}

class _addcomplaintuserState extends State<addcomplaintuser> {
  late TextEditingController complaint;
  @override
  void initState()
  {
    complaint=TextEditingController();
    super.initState();
  }
  void postdata()async{
     var url=Uri.parse(login.url+"complaint/%20complaint/");
    var resp=await post(url,body:{
      'complaint':complaint.text.toString(),
      "cid":addcomplaintuser.cid,
      "uid":login.uid

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: draw_user(),
      bottomNavigationBar: botnav_user(),
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
                      builder: (BuildContext context)=> addcomplaintuser()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(223, 26, 158, 163),
                  ),
                  child: Text("Post"),
                ),
              ),
              

            ],) ),
        ),
      ), 
    );
  }
}

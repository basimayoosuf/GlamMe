import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavuser.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
class suggestion extends StatefulWidget {
  const suggestion({Key? key}) : super(key: key);

  @override
  State<suggestion> createState() => _suggestionState();
}

class _suggestionState extends State<suggestion> {
  late TextEditingController suggestions ;
  @override
  void initState()
  {
    suggestions=TextEditingController();
    super.initState();
  }
  void postdata()async{
     var url=Uri.parse(login.url+"suggestion/%20suggestion/");
    var resp=await post(url,body:{
      'suggestion':suggestions.text.toString(),
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw_user(),
      bottomNavigationBar: botnav_user(),
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Suggestions', style:new TextStyle(fontSize: 30,color: Colors.white, ),),
      iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: suggestions,
                  decoration: InputDecoration(
                    labelText: 'Suggestion',
                    hintText: 'suggestion',
                    prefixIcon: Icon(Icons.note),
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
                      builder: (BuildContext context)=> suggestion()));
                    
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
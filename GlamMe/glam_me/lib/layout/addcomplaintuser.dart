import 'package:flutter/material.dart';
import 'package:http/http.dart';
class addcomplaintuser extends StatefulWidget {
  const addcomplaintuser({Key? key}) : super(key: key);

  @override
  State<addcomplaintuser> createState() => _addcomplaintuserState();
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
    String url="";
    var resp=await post(url,body:{
      'complaint':complaint.text.toString(),

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add complaint', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [

               Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Complaint',
                    hintText: 'complaint',
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
                      builder: (BuildContext context)=> addcomplaintuser()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(223, 26, 158, 163),
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

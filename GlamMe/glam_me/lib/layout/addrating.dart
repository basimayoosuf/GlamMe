import 'package:flutter/material.dart';
import 'package:http/http.dart';
class addrating extends StatefulWidget {
  const addrating({Key? key}) : super(key: key);

  @override
  State<addrating> createState() => _addratingState();
}

class _addratingState extends State<addrating> {
  late TextEditingController rating,feedback;
  @override
  void initState(){
    rating=TextEditingController();
    feedback=TextEditingController();
    super.initState();
  }
   void postdata()async{
    String url="";
    var resp=await post(url,body:{
      'rating':rating.text.toString(),
      'feedback':feedback.text.toString(),
      

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add rating', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Rating',
                    hintText: 'rating',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Feedback',
                    hintText: 'feedback',
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
                      builder: (BuildContext context)=> addrating()));
                    
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
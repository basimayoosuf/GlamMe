import 'package:flutter/material.dart';
import 'package:http/http.dart';
class addpreviouswork extends StatefulWidget {
  const addpreviouswork({Key? key}) : super(key: key);

  @override
  State<addpreviouswork> createState() => _addpreviousworkState();
}

class _addpreviousworkState extends State<addpreviouswork> {
  late TextEditingController image;
  @override
  void initState(){
    image=TextEditingController();
    super.initState();
  }
   void postdata()async{
    String url="";
    var resp=await post(url,body:{
      'image':image.text.toString(),
      

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add previous work', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
   body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Image',
                    hintText: 'image',
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
                      builder: (BuildContext context)=> addpreviouswork()));
                    
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
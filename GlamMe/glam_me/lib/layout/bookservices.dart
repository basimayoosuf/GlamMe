import 'package:flutter/material.dart';
import 'package:http/http.dart';
class bookservices extends StatefulWidget {
  const bookservices({Key? key}) : super(key: key);

  @override
  State<bookservices> createState() => _bookservicesState();
}

class _bookservicesState extends State<bookservices> {
  late TextEditingController date,time;
   @override
  void initState(){
    date=TextEditingController();
    time=TextEditingController();
    super.initState();
  }
   void postdata()async{
    String url="";
    var resp=await post(url,body:{
      'date':date.text.toString(),
      'time':time.text.toString(),
      

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Book services', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
             Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'date',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              
               Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Time',
                    hintText: 'time',
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
                      builder: (BuildContext context)=> bookservices()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(223, 26, 158, 163),
                  ),
                  child: Text("Book"),
                ),
              ),

              

            ],) ),
        ),
      ),   
    );

  }
}
import 'package:flutter/material.dart';
import 'package:glam_me/layout/login.dart';
import 'dart:convert';
import 'package:http/http.dart';


class view_rating extends StatefulWidget {
  const view_rating({Key? key}) : super(key: key);
  @override
  State<view_rating> createState() => _view_ratingState();
}
class _view_ratingState extends State<view_rating> {

  @override
  void initState() {
    // TODO: implement initState
    List_function();
    super.initState();
  }

  List data=[];

  
  void List_function() async {
    var url = Uri.parse(login.url+"rating/view/");
    Response resp1 = await get(url);
    // data = jsonDecode(resp1.body);
    setState(() {
      data = jsonDecode(resp1.body);
    });
    print(resp1.body);
  }
  @override
  Widget build(BuildContext context) {
  List_function();
    return Scaffold(
      
    
      appBar: AppBar(
       backgroundColor: Colors.pink,
        title: Text("Ratings",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
       body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ff.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)
                  ),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      //  tap funtion here

                    },
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
                              //  Text("Username : "+" "+data[index]['aname'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium,
                              // ),
                              // new SizedBox(height: 6.0),
                              new Text("Rating : "+" "+data[index]['rating'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                             
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );
    
  }
}
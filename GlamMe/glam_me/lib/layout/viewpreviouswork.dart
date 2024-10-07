import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';


class view_comment extends StatefulWidget {
  const view_comment({Key? key}) : super(key: key);
  @override
  State<view_comment> createState() => _view_commentState();
}
class _view_commentState extends State<view_comment> {
  late List data;
  void List_function() async {
    var url = Uri.parse("");
    Response resp1 = await get(url);
    // data = jsonDecode(resp1.body);
    this.setState(() {
      data = jsonDecode(resp1.body);
    });
    print(resp1.body);
  }
  @override
  Widget build(BuildContext context) {
     List_function();
    return Scaffold(
      // drawer: drawuser(),
      appBar: AppBar(
       backgroundColor: Colors.pink,
        title: Text("Previous work",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                              new Text("Artist : "+" "+data[index]['artist'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(('Image : ' ).toUpperCase()+" "+data[index]['image'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
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
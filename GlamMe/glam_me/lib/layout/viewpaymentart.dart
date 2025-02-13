import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavartist.dart';
import 'package:glam_me/layout/draw_artist.dart';
import 'package:glam_me/layout/login.dart';
import 'dart:convert';
import 'package:http/http.dart';


class view_paymentart extends StatefulWidget {
  const view_paymentart({Key? key}) : super(key: key);
  @override
  State<view_paymentart> createState() => _view_paymentartState();
}
class _view_paymentartState extends State<view_paymentart> {
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"payment/%20view/");
    Response resp1 = await post(url,body: {
      'uid':login.uid
    });
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
      drawer: draw_artist(),
      bottomNavigationBar: botnav_artist(),
      // drawer: drawuser(),
      appBar: AppBar(
       backgroundColor: Colors.pink,
        title: Text("Payment",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
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
                              new Text("Booking : "+" "+data[index]['bid'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(('Amount : ' ).toUpperCase()+" "+data[index]['amount'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),

                              new Text(('Method : ' ).toUpperCase()+" "+data[index]['method'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),
                              // new Text("Cvv : "+" "+data[index]['cvv'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium,
                              // ),
                              // new SizedBox(height: 6.0),

                              // new Text(('Card holder name : ' ).toUpperCase()+" "+data[index]['cardholder_name'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),

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
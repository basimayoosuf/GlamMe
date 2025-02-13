import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavartist.dart';
import 'package:glam_me/layout/draw_artist.dart';
import 'package:glam_me/layout/login.dart';
import 'dart:convert';
import 'package:http/http.dart';


class update_worksts extends StatefulWidget {
  const update_worksts({Key? key}) : super(key: key);
  @override
  State<update_worksts> createState() => _update_workstsState();
}
class _update_workstsState extends State<update_worksts> {
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"assigned_work/%20update/");
    Response resp1 = await post(url,body: {'uid':login.uid});
    // data = jsonDecode(resp1.body);
    this.setState(() {
      data = jsonDecode(resp1.body);
    });
    print(resp1.body);
  }

void accept(aid) async {
    var url = Uri.parse(login.url+"assigned_work/%20accept/");
    Response resp1 = await post(url,body: {
      "aid":aid
    });
      }

  void reject(aid) async {
    var url = Uri.parse(login.url+"assigned_work/%20reject/");
    Response resp1 = await post(url,body: {
      "aid":aid
    });
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
        title: Text("",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
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
                              // new Text("Service : "+" "+data[index]['service'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium,
                              // ),
                              // new SizedBox(height: 6.0),

                              new Text(('Booking : ' ).toUpperCase()+" "+data[index]['book'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),

                              new Text(('Date : ' ).toUpperCase()+" "+data[index]['bdate'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),

                              new Text(('Time : ' ).toUpperCase()+" "+data[index]['btime'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),

                              new Text(('Status : ' ).toUpperCase()+" "+data[index]['status'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),

                              // new Text(('User : ' ).toUpperCase()+" "+data[index]['user'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                            ],
                          ),
                        ),
Row(
  children: [
    Container(
      padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
      child: ElevatedButton(
        onPressed: () {
          accept(data[index]['assigned_id'].toString());
        },
        style :ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 10)
        ),
        child: Text("Approve",style: TextStyle(color: Colors.white),),
      ),
    ),
    Container(
      padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
      child: ElevatedButton(
        onPressed: () {
          reject(data[index]['assigned_id'].toString());
        },
        style:ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(vertical: 10)
        ),
        child: Text("Reject",style: TextStyle(color: Colors.white),),
      ),
    ),
  ]
),

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




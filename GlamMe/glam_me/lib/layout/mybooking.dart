import 'package:flutter/material.dart';
import 'package:glam_me/layout/addcomplaintuser.dart';
import 'package:glam_me/layout/addpayment.dart';
import 'package:glam_me/layout/addrating.dart';
import 'package:glam_me/layout/botnavuser.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/login.dart';
import 'dart:convert';
import 'package:http/http.dart';

class mybooking extends StatefulWidget {
  const mybooking({Key? key}) : super(key: key);
  @override
  State<mybooking> createState() => _mybookingState();
}

class _mybookingState extends State<mybooking> {
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url + "/booking/myb/");
    Response resp1 = await post(url,body: {'uid' : login.uid});
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
      drawer: draw_user(),
      bottomNavigationBar: botnav_user(),
      // drawer: drawuser(),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "My Booking",
          style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
        ),iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/ff.jpg'),
            fit: BoxFit.cover,
          )),
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)),
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
                              new Text(
                                "Service : " +
                                    " " +
                                    data[index]['service'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              new Text(
                                "Amount : " +
                                    " " +
                                    data[index]['rate'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(
                                  ('Date : ').toUpperCase() +
                                      " " +
                                      data[index]['date'].toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              new SizedBox(height: 6.0),

                              new Text(
                                "Time : " +
                                    " " +
                                    data[index]['time'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              new Text(
                                "Status : " +
                                    " " +
                                    data[index]['status'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    addcomplaintuser.cid = data[index]['complaint_id'].toString();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (BuildContext context) =>addcomplaintuser()));
                                  },
                                  child: Text("Complaint"),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    addrating.rid= data[index]['rating_id'].toString();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                addrating()));
                                  },
                                  child: Text("Rate"),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    addpayment.pid= data[index]['payment_id'].toString();
                                    addpayment.amt=data[index]['rate'].toString();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                addpayment()));
                                  },
                                  child: Text("Pay"),
                                ),
                              ),

                              
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

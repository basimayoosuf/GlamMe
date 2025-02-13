// import 'package:flutter/material.dart';
// import 'package:glam_me/layout/botnavuser.dart';
// import 'package:glam_me/layout/draw_user.dart';
// import 'package:glam_me/layout/login.dart';
// import 'package:glam_me/layout/viewpreviouswork.dart';
// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:glam_me/layout/bookservices.dart';


// class view_artist extends StatefulWidget {
//   const view_artist({Key? key}) : super(key: key);
//   @override
//   State<view_artist> createState() => _view_artistState();
//   static var ser_id;
// }
// class _view_artistState extends State<view_artist> {
//   late List data;
//   void List_function() async {
//     var url = Uri.parse(login.url+"service/view_artservices/");
//     Response resp1 = await post(url,body: {'sid':view_artist.ser_id});
//     // data = jsonDecode(resp1.body);
//     this.setState(() {
      
//       data = jsonDecode(resp1.body);
//     });
//     print(resp1.body);
//   }
//   @override
//   Widget build(BuildContext context) {
//      List_function();
//     return Scaffold(
//       drawer: draw_user(),
//       bottomNavigationBar: botnav_user(),
//       // drawer: drawuser(),
//       appBar: AppBar(
//        backgroundColor: Colors.pink,
//         title: Text("Artist",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//        body: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/ff.jpg'),
//                 fit: BoxFit.cover,
//               )
//           ),
//           child: new ListView.builder(
//             itemCount: data == null ? 0 : data.length,
//             // itemCount: 2,
//             itemBuilder: (context, index) {
//               return new Padding(
//                 padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
//                 child: new Card(
//                   elevation: 2.0,
//                   shape: new RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(16.0)
//                   ),
//                   child: InkWell(
//                     onTap: () {
//                       print("tapped");
//                       //  tap funtion here

//                     },
//                     child: new Column(
//                       children: <Widget>[
//                         new Padding(
//                           padding: new EdgeInsets.all(16.0),
//                           child: new Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               // Image.network(login.url+"static/"+data[index]['image'].toString()),
//                               new Text("Artist Code : "+" "+data[index]['artist_id'].toString(), style: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .titleMedium,
//                               ),
//                               new SizedBox(height: 6.0),
//                               new Text("Artist Name : "+" "+data[index]['artistname'].toString(), style: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .titleMedium,
//                               ),
//                               new SizedBox(height: 6.0),

//                               new Text(('Qualification : ' ).toUpperCase()+" "+data[index]['qualification'].toString(), style: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .titleMedium
//                               ),
//                                new SizedBox(height: 6.0),

//                               new Text("Email : "+" "+data[index]['e_mail'].toString(), style: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .titleMedium,
//                               ),
//                               // new SizedBox(height: 6.0),
//                               // new Text("Phone : "+" "+data[index]['phone'].toString(), style: Theme
//                               //     .of(context)
//                               //     .textTheme
//                               //     .titleMedium,
//                               // ),
//                               new SizedBox(height: 6.0),
//                               new Text("Image : "+" "+data[index]['image'].toString(), style: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .titleMedium,
//                               ),
//                               new SizedBox(height: 6.0),
//                               new Text("Portfolio image : "+" "+data[index]['image'].toString(), style: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .titleMedium,
//                               ),
//                               new SizedBox(height: 6.0),
//                               new Text("Amount : "+" "+data[index]['rate'].toString(), style: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .titleMedium,
//                               ),
//                                 new SizedBox(height: 6.0),
// Container(
//                                 padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     bookservices.sid= data[index]['booking_id'].toString();
//                                     view_previouswork.artid=data[index]['artist_id'].toString();
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (BuildContext context) =>
//                                                 view_previouswork()));
//                                   },
//                                   child: Text("Previous Works"),
//                                 ),
//                               ),


//                                 Container(
//                                 padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     bookservices.sid= data[index]['service'].toString();
//                                     bookservices.amount= data[index]['rate'].toString();
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (BuildContext context) =>
//                                                 bookservices()));
//                                   },
//                                   child: Text("Book Now"),
//                                 ),
//                               ),







//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           )
//       ),
//     );
    
//   }
// }



















import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavuser.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/login.dart';
import 'package:glam_me/layout/viewpreviouswork.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:glam_me/layout/bookservices.dart';

class view_artist extends StatefulWidget {
  const view_artist({Key? key}) : super(key: key);
  @override
  State<view_artist> createState() => _view_artistState();
  static var ser_id;
}

class _view_artistState extends State<view_artist> {
  late List data = [];

  void fetchArtists() async {
    var url = Uri.parse(login.url + "service/view_artservices/");
    Response response = await post(url, body: {'sid': view_artist.ser_id});
    setState(() {
      data = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchArtists();
    return Scaffold(
      drawer: draw_user(),
      bottomNavigationBar: botnav_user(),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Artist Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(login.url + "static/" + (data[index]['image']?.toString() ?? 'default.jpg')),
                    ),
                    SizedBox(height: 10),
                    Text(
                      data[index]['artistname']?.toString() ?? 'Unknown',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      
                     "Qualification: " + (data[index]['qualification']?.toString() ?? 'N/A'),
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Email: " + (data[index]['e_mail']?.toString() ?? 'Not available'),
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Amount: " + (data[index]['rate']?.toString() ?? '0.0'),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (starIndex) {
                        double rating = double.tryParse(data[index]['rating']?.toString() ?? '0.0') ?? 0.0;
                        return Icon(
                          starIndex < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 30,
                        );
                      }),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                          onPressed: () {
                            view_previouswork.artid = data[index]['artist_id']?.toString() ?? '';
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => view_previouswork()),
                            );
                          },
                          child: Text("Previous Works"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          onPressed: () {
                            bookservices.sid = data[index]['service']?.toString() ?? '';
                            bookservices.amount = data[index]['rate']?.toString() ?? '0.0';
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => bookservices()),
                            );
                          },
                          child: Text("Book Now"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

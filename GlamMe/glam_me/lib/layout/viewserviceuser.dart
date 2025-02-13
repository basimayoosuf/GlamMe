// import 'package:flutter/material.dart';
// import 'package:glam_me/layout/bookservices.dart';
// import 'package:glam_me/layout/botnavuser.dart';
// import 'package:glam_me/layout/draw_user.dart';
// import 'package:glam_me/layout/login.dart';
// import 'package:glam_me/layout/viewartist.dart';
// import 'dart:convert';
// import 'package:http/http.dart';


// class view_serviceuser extends StatefulWidget {
//   const view_serviceuser({Key? key}) : super(key: key);
//   @override
//   State<view_serviceuser> createState() => _view_serviceuserState();
// }
// class _view_serviceuserState extends State<view_serviceuser> {
//    List data=[];
//   void List_function() async {
//     var url = Uri.parse(login.url+"service/serv_view/");
//     Response resp1 = await get(url);
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
//        backgroundColor: Colors.pinkAccent,
//         title: Text("Services",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
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
//                               // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
//                               // new Text("Artist : "+" "+data[index]['artist'].toString(), style: Theme
//                               //     .of(context)
//                               //     .textTheme
//                               //     .titleMedium,
//                               // ),
//                               // new SizedBox(height: 6.0),

//                               new Text(('Service : ' ).toUpperCase()+" "+data[index]['service'].toString(), style: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .titleMedium
//                               ),
//                               new SizedBox(height: 6.0),

//                                Container(
//                                 padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     view_artist.ser_id=data[index]['service_id'].toString();
//                                     bookservices.sid= data[index]['artist_id'].toString();
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (BuildContext context) =>
//                                                 view_artist()));
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










// import 'package:flutter/material.dart';
// import 'package:glam_me/layout/bookservices.dart';
// import 'package:glam_me/layout/botnavuser.dart';
// import 'package:glam_me/layout/draw_user.dart';
// import 'package:glam_me/layout/login.dart';
// import 'package:glam_me/layout/viewartist.dart';
// import 'dart:convert';
// import 'package:http/http.dart';

// class view_serviceuser extends StatefulWidget {
//   const view_serviceuser({Key? key}) : super(key: key);

//   @override
//   State<view_serviceuser> createState() => _view_serviceuserState();
// }

// class _view_serviceuserState extends State<view_serviceuser> {
//   List<dynamic> data = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchServices();
//   }

//   void fetchServices() async {
//     var url = Uri.parse(login.url + "service/serv_view/");
//     Response response = await get(url);

//     if (response.statusCode == 200) {
//       setState(() {
//         data = jsonDecode(response.body);
//       });
//     } else {
//       print("Error fetching data: ${response.statusCode}");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: draw_user(),
//       bottomNavigationBar: botnav_user(),
//       appBar: AppBar(
//         backgroundColor: Colors.pinkAccent,
//         title: Text(
//           "Services",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Stack(
//         children: [
//           // Background Image with Overlay
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/ff.jpg'),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
//               ),
//             ),
//           ),
//           // Service List
//           data.isEmpty
//               ? Center(child: CircularProgressIndicator(color: Colors.pinkAccent))
//               : ListView.builder(
//                   padding: EdgeInsets.all(16),
//                   itemCount: data.length,
//                   itemBuilder: (context, index) {
//                     var service = data[index];

//                     return GestureDetector(
//                       onTap: () {
//                         view_artist.ser_id = service['service_id'].toString();
//                         bookservices.sid = service['artist_id'].toString();
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => view_artist()),
//                         );
//                       },
//                       child: Card(
//                         elevation: 6,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                         margin: EdgeInsets.symmetric(vertical: 10),
//                         child: Container(
//                           padding: EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16),
//                             gradient: LinearGradient(
//                               colors: [Colors.pinkAccent.withOpacity(0.8), Colors.deepPurple.withOpacity(0.8)],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               // Service Icon
//                               CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 35,
//                                 child: Icon(Icons.design_services, color: Colors.pinkAccent, size: 35),
//                               ),
//                               SizedBox(width: 16),
//                               // Service Info
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       service['service'].toString().toUpperCase(),
//                                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//                                     ),
//                                     SizedBox(height: 6),
//                                     Text(
//                                       "Tap to view details",
//                                       style: TextStyle(fontSize: 14, color: Colors.white70),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               // Arrow Icon
//                               Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 20),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//         ],
//       ),
//     );
//   }
// }













import 'package:flutter/material.dart';
import 'package:glam_me/layout/bookservices.dart';
import 'package:glam_me/layout/botnavuser.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/login.dart';
import 'package:glam_me/layout/viewartist.dart';
import 'dart:convert';
import 'package:http/http.dart';

class view_serviceuser extends StatefulWidget {
  const view_serviceuser({Key? key}) : super(key: key);

  @override
  State<view_serviceuser> createState() => _view_serviceuserState();
}

class _view_serviceuserState extends State<view_serviceuser> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  void fetchServices() async {
    var url = Uri.parse(login.url + "service/serv_view/");
    Response response = await get(url);

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      print("Error fetching data: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw_user(),
      bottomNavigationBar: botnav_user(),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
           
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              "Choose your Service",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          
          // Service List
          Expanded(
            child: data.isEmpty
                ? Center(child: CircularProgressIndicator(color: Colors.pinkAccent))
                : ListView.builder(
                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var service = data[index];

                      return GestureDetector(
                        onTap: () {
                          view_artist.ser_id = service['service_id'].toString();
                          bookservices.sid = service['artist_id'].toString();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => view_artist()),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                            leading: CircleAvatar(
                              backgroundColor: Colors.pinkAccent.withOpacity(0.1),
                              radius: 25,
                              child: Icon(Icons.design_services, color: Colors.pinkAccent, size: 30),
                            ),
                            title: Text(
                              service['service'].toString(),
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:glam_me/layout/botnavuser.dart';
// import 'package:glam_me/layout/draw_user.dart';
// import 'package:glam_me/layout/login.dart';
// import 'package:http/http.dart';
// class addrating extends StatefulWidget {
//   const addrating({Key? key}) : super(key: key);

//   @override
//   State<addrating> createState() => _addratingState();
//   static String rid="";
// }

// class _addratingState extends State<addrating> {
//   late TextEditingController rating,feedback;
//   @override
//   void initState(){
//     rating=TextEditingController();
//     feedback=TextEditingController();
//     super.initState();
//   }
//    void postdata()async{
//      var url=Uri.parse(login.url+"rating/%20rating/");
//     var resp=await post(url,body:{
//       'rating':rating.text.toString(),
//       'feedback':feedback.text.toString(),
//       "rid":addrating.rid,
//       "uid":login.uid
      

//     });

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: draw_user(),
//       bottomNavigationBar: botnav_user(),
//        appBar:AppBar(backgroundColor: Colors.pinkAccent , 
//       title: Text('Add rating', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
//       body: Container(
//         child: Center(
//           child: SingleChildScrollView(
//             child:Column(children: [
//               Container(
//                 padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
//                 child: TextFormField(
//                   controller: rating,
//                   decoration: InputDecoration(
//                     labelText: 'Rating',
//                     hintText: 'rating',
//                     prefixIcon: Icon(Icons.note),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
//                 child: TextFormField(
//                   controller: feedback,
//                   decoration: InputDecoration(
//                     labelText: 'Feedback',
//                     hintText: 'feedback',
//                     prefixIcon: Icon(Icons.note),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//                   ),
//                 ),
//               ),

//                Container(
//                 padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     postdata();
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (BuildContext context)=> addrating()));
                    
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(223, 26, 158, 163),
//                   ),
//                   child: Text("Post"),
//                 ),
//               ),

//             ],) ),
//         ),
//       ),   
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavuser.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';  // Import the rating bar package

class addrating extends StatefulWidget {
  const addrating({Key? key}) : super(key: key);

  @override
  State<addrating> createState() => _addratingState();
  static String rid = "";
}

class _addratingState extends State<addrating> {
  late TextEditingController feedback;
  double ratingValue = 0;  // To store the rating value

  @override
  void initState() {
    feedback = TextEditingController();
    super.initState();
  }

  void postdata() async {
    var url = Uri.parse(login.url + "rating/%20rating/");
    var resp = await post(url, body: {
      'rating': ratingValue.toString(),
      'feedback': feedback.text.toString(),
      "rid": addrating.rid,
      "uid": login.uid,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw_user(),
      bottomNavigationBar: botnav_user(),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Add rating',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Replace TextFormField with RatingBar
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: RatingBar.builder(
                    
                    initialRating: ratingValue,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 40.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        ratingValue = rating;  // Update the rating value
                      });
                    },
                  ),
                ),
                // Feedback text field remains the same
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: feedback,
                    decoration: InputDecoration(
                      labelText: 'Feedback',
                      hintText: 'feedback',
                      prefixIcon: Icon(Icons.notes),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                // Post button
                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      postdata();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => addrating()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(223, 26, 158, 163),
                    ),
                    child: Text("Post"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:glam_me/layout/login.dart';
class draw_user extends StatefulWidget {
  const draw_user({Key? key}) : super(key: key);

  @override
  State<draw_user> createState() => _draw_userState();
}
class _draw_userState extends State<draw_user> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
         color: Color.fromARGB(255, 239, 240, 240),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/tt.png'),
                    child: Icon(
    Icons.person,
    size: 60,
    color: Colors.grey,  // Icon color can be white or any color
  ),
                      // backgroundImage: ,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 30, 10),
                      child: Text(
                        'User',
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                    ),
                  )

                ],
                alignment: AlignmentDirectional.center,
              ),
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 238, 25, 96)
               color: Color.fromARGB(255, 32, 26, 48),
              ),
            ),

            // ListTile(
            //   leading: Icon(Icons.people),
            //   title: Text('View Artist'),
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/viewartist');
            //   },
            // ),

            ListTile(
              leading: Icon(Icons.details),
              title: Text('Services'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewserviceuser');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.image_rounded,color:Colors.pinkAccent),
            //   title: Text('View Previous Work',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold,fontSize: 20),),
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/viewpreviouswork');
            //   },
            // ),
            
            // ListTile(
            //   leading: Icon(Icons.book),
            //   title: Text('Book Service'),
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/bookservices');
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.star_border),
            //   title: Text('Add Rating'),
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/addrating');
            //   },
            // ),

            // ListTile(
            //   leading: Icon(Icons.feedback_rounded),
            //   title: Text('Add Complaint'),
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/addcomplaintartist');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('View Reply'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewreplyuser');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.note_add_sharp),
            //   title: Text('Suggestion',style: TextStyle(fontSize: 20),),
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/suggestion');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('View Notifications'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewnotificationuser');
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('View Offers'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewoffer');
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('My Profile'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/userprofile');
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('My Booking'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/mybooking');
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Logout'),
              onTap: (){
                // Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => login()));
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
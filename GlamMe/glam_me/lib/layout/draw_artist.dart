import 'package:flutter/material.dart';
import 'package:glam_me/layout/login.dart';
class draw_artist extends StatefulWidget {
  const draw_artist({Key? key}) : super(key: key);

  @override
  State<draw_artist> createState() => _draw_artistState();
}
class _draw_artistState extends State<draw_artist> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
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
                      // backgroundImage: ,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 30),
                      child: Text(
                        'Welcome Artist',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )

                ],
                alignment: AlignmentDirectional.center,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 26, 48),
              ),
            ),

            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Update Profile'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/updateprofileartist');
              },
            ),
            ListTile(
              leading: Icon(Icons.add_a_photo_sharp),
              title: Text('Add Previous Work'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/addpreviouswork');
              },
            ),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text('Add Services'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/addservice');
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('Add Offers'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/addoffer');
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('View Payment'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewpaymentart');
              },
            ),

            ListTile(
              leading: Icon(Icons.details),
              title: Text('My Works'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewassignedwork');
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Update Work Status'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/updateworkstatus');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.feedback_rounded),
            //   title: Text('Add Complaint'),
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/addcomplaintartist');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.reply_all_rounded),
              title: Text('View Reply'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewreplyartist');
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('View Notifications'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewnotificationartist');
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
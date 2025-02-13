import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:glam_me/layout/draw_artist.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/mainpageartist.dart';
import 'package:glam_me/layout/mainpageuser.dart';
import 'package:glam_me/layout/mainregister.dart';
import 'package:http/http.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
static var url="http://192.168.0.150:8000/";
static var uid="";
}

class _loginState extends State<login> {
    late TextEditingController USER_NAME,PASSWORD;
       bool _passwordVisible = true;
    var data=[];
  @override
  void initState(){
    USER_NAME=TextEditingController();
    PASSWORD=TextEditingController();
    super.initState();
  }

void showCustomDialog(BuildContext context, {String message = "You have successfully logged in"}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Login Status", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

void postdata()async{
  var url=Uri.parse(login.url+"login/asdf/");
  Response resp = await post(url,body: {
  "username":USER_NAME.text,
  "password":PASSWORD.text,
});
data=jsonDecode(resp.body);
if(data.length>0)
{
  login.uid=data[0]['u_id'].toString();
  if(data[0]['type']=="user")
  { 
    Navigator.of(context).push(MaterialPageRoute(
      builder:(BuildContext)=> mainpage_user()));
      showCustomDialog(context);
  }
  if(data[0]['type']=="artist"  && data[0]['status']=="approved")
  { 
    Navigator.of(context).push(MaterialPageRoute(
      builder:(BuildContext)=> mainpage_artist()));
      showCustomDialog(context);
  }

}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.pinkAccent,title: Text('Login'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/hh.jpg'),
          //   fit: BoxFit.cover,
          //    ),
          gradient: LinearGradient(
            colors:[Colors.white,Colors.pinkAccent],
            begin:Alignment.topLeft,
            end: Alignment.bottomRight,),
        ),
        child: Center(
          child:SingleChildScrollView(
            child:Column(
              children: [
             Container(
  margin: const EdgeInsets.only(bottom: 20),
  child: const Text(
    'GlamMe',
    style: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w600,  // Slightly bolder than FontWeight.bold
      fontStyle: FontStyle.italic, // Makes the text italic
      color: Colors.redAccent,
    ),
  ),
),

                Container(
                padding:EdgeInsets.fromLTRB(90, 10, 90, 0),
                child: TextFormField(
                  controller: USER_NAME,
                  decoration: InputDecoration(
                    labelText: "USER NAME",
                    hintText: "username",
                    prefixIcon:Icon( Icons.person),
                    border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20)
                    )
                    ),
                ),
              ),
              Container(
                padding:EdgeInsets.fromLTRB(90, 10, 90, 0),
                child: TextFormField(
                  obscureText: _passwordVisible,
                  controller: PASSWORD,
                  decoration: InputDecoration(
                    labelText: "PASSWORD",
                    hintText: "password",
                          suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
                   
                    prefixIcon:Icon( Icons.lock),
                    border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20)
                    )
                    ),
                ),
              ),
              Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: ElevatedButton(
    onPressed: () {
      postdata();
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => login()));
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      minimumSize: Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(120), // Adjust this value for more or less curve
      ),
      foregroundColor: Colors.white, // Change the text color here
    ),
    child: Text("LOGIN"),
  ),
),

               Container(
  padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
  child: Column(
    children: [
      // Row with "Do you have an account?" and the Register button
      Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the row's contents
        children: [
          // Text "Do you have an account?"
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54, // Customize this color as needed
            ),
          ),
          // SizedBox(width: 10), // Spacing between the text and the button

          // Register button styled like a link
          TextButton(
            onPressed: () {
              // postdata();
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => option()));
            },
            style: TextButton.styleFrom(
              foregroundColor: Color.fromARGB(223, 26, 158, 163), // Text color (link-like)
              textStyle: TextStyle(
                fontSize: 14, // Adjust text size if needed
                fontWeight: FontWeight.bold, // Optional: make it bold
                // decoration: TextDecoration.underline, // Underline to resemble a link
              ),
            ),
            child: Text("REGISTER"),
          ),
        ],
      ),
    ],
  ),
)

              ],
            ) ,) ),
        ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:glam_me/layout/mainregister.dart';
// import 'package:glam_me/layout/mainpageuser.dart';
// import 'package:glam_me/layout/mainpageartist.dart';

// class login extends StatefulWidget {
//   const login({Key? key}) : super(key: key);

//   static var url = "http://192.168.1.39:8000/";
//   static var uid = "";

//   @override
//   State<login> createState() => _loginState();
// }

// class _loginState extends State<login> {
//   late TextEditingController userNameController, passwordController;
//   bool _passwordVisible = true;

//   @override
//   void initState() {
//     userNameController = TextEditingController();
//     passwordController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.purple, Colors.pinkAccent],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/hh.jpg',
//                   height: 150,
//                   errorBuilder: (context, error, stackTrace) {
//                     return const Icon(Icons.image, size: 150, color: Colors.white);
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "SIGN IN",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                   child: TextFormField(
//                     controller: userNameController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelText: "Username",
//                       prefixIcon: const Icon(Icons.person),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                   child: TextFormField(
//                     obscureText: _passwordVisible,
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelText: "Password",
//                       prefixIcon: const Icon(Icons.lock),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _passwordVisible
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _passwordVisible = !_passwordVisible;
//                           });
//                         },
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Functionality retained
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 100, vertical: 15),
//                   ),
//                   child: const Text(
//                     "LOGIN",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) => const option()));
//                   },
//                   child: const Text(
//                     "Don't have an account? REGISTER",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
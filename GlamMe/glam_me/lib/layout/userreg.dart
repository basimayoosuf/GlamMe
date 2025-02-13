// import 'package:flutter/material.dart';
// import 'package:glam_me/layout/login.dart';
// import 'package:http/http.dart';
// class userreg extends StatefulWidget {
//   const userreg({Key? key}) : super(key: key);

//   @override
//   State<userreg> createState() => _userregState();
// }

// class _userregState extends State<userreg> {
//   late TextEditingController username,password,address,email,phone,location;
//   @override
//   void initState(){
//     username=TextEditingController();
//     password=TextEditingController();
//     address=TextEditingController();
//     email=TextEditingController();
//     phone=TextEditingController();
//     location=TextEditingController();
//     super.initState();
//   }
//   void postdata()async{
//      var url=Uri.parse(login.url+"user/%20user_reg/");
//     var resp=await post(url,body:{
//       'username':username.text.toString(),
//       'password':password.text.toString(),
//       'address':address.text.toString(),
//       'email':email.text.toString(),
//       'phone':phone.text.toString(),
//       'location':location.text.toString(),
//     });

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar:AppBar(backgroundColor: Colors.pinkAccent , 
//       title: Text('Register', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),iconTheme: IconThemeData(color: Colors.white),),
//       body: Container(
//         child: Center(
//           child: SingleChildScrollView(
//             child:Column(children: [
//               Container(
//                 padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
//                 child: TextFormField(
//                   controller: username,
//                   decoration: InputDecoration(
//                     labelText: 'User name',
//                     hintText: 'user name',
//                     prefixIcon: Icon(Icons.person),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
//                 child: TextFormField(
//                   controller: password,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     hintText: 'password',
//                     prefixIcon: Icon(Icons.password),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
//                 child: TextFormField(
//                   controller: address,
//                   decoration: InputDecoration(
//                     labelText: 'Address',
//                     hintText: 'address',
//                     prefixIcon: Icon(Icons.home_filled),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
//                 child: TextFormField(
//                   controller: email,
//                   decoration: InputDecoration(
//                     labelText: 'E-mail',
//                     hintText: 'e-mail',
//                     prefixIcon: Icon(Icons.alternate_email),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
//                 child: TextFormField(
//                   controller: phone,
//                   decoration: InputDecoration(
//                     labelText: 'Phone',
//                     hintText: 'phone',
//                     prefixIcon: Icon(Icons.phone),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
//                 child: TextFormField(
//                   controller: location,
//                   decoration: InputDecoration(
//                     labelText: 'Location',
//                     hintText: 'location',
//                     prefixIcon: Icon(Icons.location_on),
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
//                       builder: (BuildContext context)=> userreg()));
                    
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(223, 26, 158, 163),
//                   ),
//                   child: Text("Register"),
//                 ),
//               ),

//             ],) ),
//         ),
//       ),   
//     );

//   }
// }




import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';

class userreg extends StatefulWidget {
  const userreg({Key? key}) : super(key: key);

  @override
  State<userreg> createState() => _userregState();
}

class _userregState extends State<userreg> {
  late TextEditingController username, password, address, email, phone, location;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
    address = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    location = TextEditingController();
  }

  // This method simulates the post request for registration
  void postdata() async {
    var url = Uri.parse(login.url + "user/%20user_reg/");
    var resp = await post(url, body: {
      'username': username.text.toString(),
      'password': password.text.toString(),
      'address': address.text.toString(),
      'email': email.text.toString(),
      'phone': phone.text.toString(),
      'location': location.text.toString(),
    });

    if (resp.statusCode == 200) {
      // If registration is successful, show a success dialog
      showSuccessDialog(context);
    } else {
      // If registration failed, show an error dialog
      showErrorDialog(context);
    }
  }

  // Function to show the success dialog
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Successful", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text("Your registration was successful!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => login(), // Redirect to login or another screen
                ));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to show the error dialog
  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Failed", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text("There was an error during registration. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Register', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        labelText: 'User name',
                        hintText: 'user name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'password',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: address,
                    decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'address',
                        prefixIcon: Icon(Icons.home_filled),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        labelText: 'E-mail',
                        hintText: 'e-mail',
                        prefixIcon: Icon(Icons.alternate_email),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                        labelText: 'Phone',
                        hintText: 'phone',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: location,
                    decoration: InputDecoration(
                        labelText: 'Location',
                        hintText: 'location',
                        prefixIcon: Icon(Icons.location_on),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      postdata(); // Trigger registration when button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(223, 26, 158, 163),
                    ),
                    child: Text("Register"),
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

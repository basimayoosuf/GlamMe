import 'dart:html';

import 'package:flutter/material.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
import 'dart:convert';

class updateprofileartist extends StatefulWidget {
  const updateprofileartist({Key? key}) : super(key: key);

  @override
  State<updateprofileartist> createState() => _updateprofileartistState();
  static var usid = "";
}

class _updateprofileartistState extends State<updateprofileartist> {
  late TextEditingController name, email, qualification, phone;
  late List data;
  bool isLoading = true;  // Track loading state

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    qualification = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
   
    fetchUserData();
  }

  void fetchUserData() async {
    var url = Uri.parse(login.url + "/artist/ccc/");
    Response resp1 = await post(url, body: {
      "usid": login.uid.toString(),
    });
    
    if (resp1.statusCode == 200) {
      data = jsonDecode(resp1.body);
      setState(() {
        name.text = data[0]["artistname"].toString();
        qualification.text = data[0]["qualification"].toString();
        phone.text = data[0]["phone"].toString();
        email.text = data[0]["email"].toString();
      
        isLoading = false; // Stop loading after data is fetched
      });
    } else {
      // Handle error if response is not successful
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: ${resp1.statusCode}');
    }
  }

  void postData() async {
     var url=Uri.parse(login.url+"/artist/update/");
    var resp = await post(url, body: {
      "usid": login.uid.toString(),
      "artistname": name.text,
      "phone": phone.text,
      "email": email.text,
      "qualification": qualification.text,
      
     
    });

    if (resp.statusCode == 200) {
      // Successfully updated
      print('Profile updated successfully');
      Navigator.of(context).pop(); // Navigate back after update
    } else {
      // Handle error if update fails
      print('Failed to update profile: ${resp.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     colors: [
        //       Color.fromARGB(255, 32, 26, 48),
        //       Color.fromARGB(255, 32, 26, 48),
        //     ],
        //   ),
        // ),
        decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('asset/b.jpg'),
      fit: BoxFit.cover,
    )
),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      if (isLoading) 
                        CircularProgressIndicator() // Show loading indicator while fetching data
                      else ...[
                        // Name input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              labelText: "Name",
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        // Phone number input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: phone,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        // Address input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.alternate_email),
                            ),
                          ),
                        ),
                        // Email input
                         Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: qualification,
                            decoration: InputDecoration(
                              labelText: "Qualification",
                              prefixIcon: Icon(Icons.school),
                            ),
                          ),
                        ),
                        // Update button
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                          child: ElevatedButton(
                            onPressed: () {
                              postData();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.tealAccent, // Background color
                            ),
                            child: Text("Update"),
                          ),
                        ),
                      ],
                    ],
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
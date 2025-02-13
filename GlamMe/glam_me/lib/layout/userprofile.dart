import 'package:flutter/material.dart';
import 'package:glam_me/layout/editprofile_user.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:glam_me/layout/editprofile_user.dart';


class userprofile extends StatefulWidget {
  final String userId;

  userprofile({required this.userId});

  @override
  _userprofileState createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    // var url = Uri.parse("${login.url}user/view_profile_user/");
     var url=Uri.parse("http://192.168.217.251:8000/user/%20view_profile_user/");
    var response = await http.post(url, body: {'uid':int.tryParse(login.uid)});

    if (response.statusCode == 200) {
      setState(() {
        userData = jsonDecode(response.body);
      });
    } else {
      print(response.body);
      print(response.statusCode);
      // ignore: avoid_print
      print("Failed to fetch profile");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), backgroundColor: Colors.pinkAccent),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          :Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username: ${userData!['username']}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text("Email: ${userData!['email']}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text("Phone: ${userData!['phone']}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text("Address: ${userData!['address']}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text("Location: ${userData!['location']}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => editprofile_user(userData: userData!),
                          ),
                        );
                      },
                      child: Text("Edit Profile"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

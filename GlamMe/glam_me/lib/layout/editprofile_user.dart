import 'package:flutter/material.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class editprofile_user extends StatefulWidget {
  final Map<String, dynamic> userData;

  editprofile_user({required this.userData});

  @override
  _editprofile_userState createState() => _editprofile_userState();
}

class _editprofile_userState extends State<editprofile_user> {
  late TextEditingController username, email, phone, address, location;

  @override
  void initState() {
    super.initState();
    username = TextEditingController(text: widget.userData['username']);
    email = TextEditingController(text: widget.userData['email']);
    phone = TextEditingController(text: widget.userData['phone']);
    address = TextEditingController(text: widget.userData['address']);
    location = TextEditingController(text: widget.userData['location']);
  }

  Future<void> updateProfile() async {
    var url = Uri.parse("${login.url}user/update_profile/");
    var response = await http.post(url, body: {
      'user_id': widget.userData['user_id'],
      'username': username.text,
      'email': email.text,
      'phone': phone.text,
      'address': address.text,
      'location': location.text,
    });

    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile updated successfully"), backgroundColor: Colors.green),
      );
      Navigator.of(context).pop(); // Go back to profile page
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update profile"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"), backgroundColor: Colors.pinkAccent),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: username, decoration: InputDecoration(labelText: "Username")),
            SizedBox(height: 10),
            TextField(controller: email, decoration: InputDecoration(labelText: "Email")),
            SizedBox(height: 10),
            TextField(controller: phone, decoration: InputDecoration(labelText: "Phone")),
            SizedBox(height: 10),
            TextField(controller: address, decoration: InputDecoration(labelText: "Address")),
            SizedBox(height: 10),
            TextField(controller: location, decoration: InputDecoration(labelText: "Location")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateProfile,
              child: Text("Update Profile"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
import 'package:file_picker/file_picker.dart';
class artistreg extends StatefulWidget {
  const artistreg({Key? key}) : super(key: key);

  @override
  State<artistreg> createState() => _artistregState();
}

class _artistregState extends State<artistreg> {
  late TextEditingController artistname,password,qualification,email,phone,image,portfolio_image;
  var file,objfile,objfile1,portfolio;
  @override
  void initState(){
    artistname=TextEditingController();
    password=TextEditingController();
    qualification=TextEditingController();
    email=TextEditingController();
    phone=TextEditingController();
    image=TextEditingController();
    portfolio_image=TextEditingController();
    super.initState();
  }
  void postdata()async{
    var url=Uri.parse(login.url+"artist/%20artist_reg/");
    var resp=await post(url,body:{
      'artistname':artistname.text.toString(),
      'password':password.text.toString(),
      'qualification':qualification.text.toString(),
      'email':email.text.toString(),
      'image':image.text.toString(),
      'portfolio_image':portfolio_image.text.toString(),
      "phone":phone.text.toString(),
    });
  


  final request = MultipartRequest(
    "POST", Uri.parse(login.url+"artist/upload/"));
  request.fields["id"] = "bus";
  request.files.add(MultipartFile( 
    'file',objfile.readStream,objfile.size,filename:objfile.name));
  var resp1= await request.send();
  final respstr = await resp1.stream.bytesToString();


  final request1 = MultipartRequest(
    "POST", Uri.parse(login.url+"/artist/uploadport/"));
  request.fields["id"] = "bus";
  request.files.add(MultipartFile( 
    portfolio,objfile1.readStream,objfile1.size,filename:objfile1.name));
  var resp2= await request.send();
  final respstr2 = await resp1.stream.bytesToString();



  }


 upload_image()async{
  print('Uploaded Successfully ');
  var result=await FilePicker.platform.pickFiles(withReadStream: true);
  if(result!=null){
    setState(() {
      file=result.files.first.name;
      objfile=result.files.single;
      image.text=file;
    });
  }else{

  }
 }

 upload_portfolio()async{
  print('Uploaded Successfully ');
  var result=await FilePicker.platform.pickFiles(withReadStream: true);
  if(result!=null){
    setState(() {
      portfolio=result.files.first.name;
      objfile1=result.files.single;
      portfolio_image.text=portfolio;
    });
  }else{

  }
 }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Register', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: artistname,
                  decoration: InputDecoration(
                    labelText: 'Artist name',
                    hintText: 'artist name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: qualification,
                  decoration: InputDecoration(
                    labelText: 'Qualification',
                    hintText: 'qualification',
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
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
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
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
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
  padding: EdgeInsets.symmetric(vertical: 1.0),
  width: double.infinity,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 5.0, backgroundColor: Colors.white,
      padding: EdgeInsets.all(15.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ), // Button background color
    ),
    onPressed: () {
      upload_image();
    },
    child: Text(
      'Upload Photo',
      style: TextStyle(
        color: Color(0xFF072850),
        letterSpacing: 1.5,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
      ),
    ),
  ),
),
              
             Container(
  padding: EdgeInsets.symmetric(vertical: 1.0),
  width: double.infinity,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 5.0, backgroundColor: Colors.white,
      padding: EdgeInsets.all(15.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ), // Button background color
    ),
    onPressed: () {
      upload_portfolio();
    },
    child: Text(
      'Upload your portfolio',
      style: TextStyle(
        color: Color(0xFF072850),
        letterSpacing: 1.5,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
      ),
    ),
  ),
), 

             Container(
                padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                child               : ElevatedButton(
                  onPressed: () {
                    postdata();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context)=> artistreg()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(223, 26, 158, 163),
                  ),
                  child: Text("Register"),
                ),
              ),

            ],) ),
        ),
      ),   
    );

  }
}
















// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart';

// class artistreg extends StatefulWidget {
//   const artistreg({Key? key}) : super(key: key);

//   @override
//   State<artistreg> createState() => _artistregState();
// }

// class _artistregState extends State<artistreg> {
//   late TextEditingController artistname, password, qualification, email, phone, image, portfolio_image;
//   var file, objfile, objfile1, portfolio;

//   @override
//   void initState() {
//     artistname = TextEditingController();
//     password = TextEditingController();
//     qualification = TextEditingController();
//     email = TextEditingController();
//     phone = TextEditingController();
//     image = TextEditingController();
//     portfolio_image = TextEditingController();
//     super.initState();
//   }

//   void postdata() async {
//     // Your POST request handling here
//   }

//   // upload_image() async {
//   //   print('Uploaded Successfully');
//   //   var result = await FilePicker.platform.pickFiles(withReadStream: true);
//   //   if (result != null) {
//   //     setState(() {
//   //       file = result.files.first.name;
//   //       objfile = result.files.single;
//   //       image.text = file;
//   //     });
//   //   } else {}
//   // }

//   // upload_portfolio() async {
//   //   print('Uploaded Successfully');
//   //   var result = await FilePicker.platform.pickFiles(withReadStream: true);
//   //   if (result != null) {
//   //     setState(() {
//   //       portfolio = result.files.first.name;
//   //       objfile1 = result.files.single;
//   //       portfolio_image.text = portfolio;
//   //     });
//   //   } else {}
//   // }




// upload_image() async {
//   print('Trying to upload image...');
//   var result = await FilePicker.platform.pickFiles(withReadStream: true);
//   if (result != null) {
//     setState(() {
//       file = result.files.first.name;
//       objfile = result.files.single;
//       image.text = file;
//     });
//     // Show success SnackBar
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Image uploaded successfully!'),
//         backgroundColor: Colors.green,
//       ),
//     );
//   } else {
//     // Show failure SnackBar
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('No image selected. Please try again!'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }

// upload_portfolio() async {
//   print('Trying to upload portfolio...');
//   var result = await FilePicker.platform.pickFiles(withReadStream: true);
//   if (result != null) {
//     setState(() {
//       portfolio = result.files.first.name;
//       objfile1 = result.files.single;
//       portfolio_image.text = portfolio;
//     });
//     // Show success SnackBar
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Portfolio uploaded successfully!'),
//         backgroundColor: Colors.green,
//       ),
//     );
//   } else {
//     // Show failure SnackBar
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('No portfolio selected. Please try again!'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }





//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.pinkAccent, // Custom AppBar color
//         title: Text(
//           'Register',
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Theme(
//         data: ThemeData(
//           inputDecorationTheme: InputDecorationTheme(
//             filled: true,
//             fillColor: Colors.grey[200], // Light background for inputs
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//             labelStyle: TextStyle(color: Colors.pinkAccent),
//           ),
//           textButtonTheme: TextButtonThemeData(
//             style: TextButton.styleFrom(foregroundColor: Colors.pinkAccent),
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Artist name field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                 child: TextFormField(
//                   controller: artistname,
//                   decoration: InputDecoration(
//                     labelText: 'Artist name',
//                     prefixIcon: Icon(Icons.person),
//                     hintText: 'Enter your artist name',
//                   ),
//                 ),
//               ),

//               // Password field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                 child: TextFormField(
//                   controller: password,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: Icon(Icons.lock),
//                     hintText: 'Enter your password',
//                   ),
//                 ),
//               ),

//               // Qualification field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                 child: TextFormField(
//                   controller: qualification,
//                   decoration: InputDecoration(
//                     labelText: 'Qualification',
//                     prefixIcon: Icon(Icons.school),
//                     hintText: 'Enter your qualifications',
//                   ),
//                 ),
//               ),

//               // Email field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                 child: TextFormField(
//                   controller: email,
//                   decoration: InputDecoration(
//                     labelText: 'E-mail',
//                     prefixIcon: Icon(Icons.alternate_email),
//                     hintText: 'Enter your email address',
//                   ),
//                 ),
//               ),

//               // Phone number field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                 child: TextFormField(
//                   controller: phone,
//                   decoration: InputDecoration(
//                     labelText: 'Phone',
//                     prefixIcon: Icon(Icons.phone),
//                     hintText: 'Enter your phone number',
//                   ),
//                 ),
//               ),

//               // Upload Image Button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pinkAccent,
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     upload_image();
//                   },
//                   child: Text(
//                     'Upload Photo',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),

//               // Upload Portfolio Button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pinkAccent,
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     upload_portfolio();
//                   },
//                   child: Text(
//                     'Upload your Portfolio',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),

//               // Register Button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     postdata();
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }













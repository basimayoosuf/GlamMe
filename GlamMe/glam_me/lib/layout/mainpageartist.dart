// import 'package:flutter/material.dart';
// import 'package:glam_me/layout/botnavartist.dart';
// import 'package:glam_me/layout/draw_artist.dart';


// class mainpage_artist extends StatefulWidget {
//   const mainpage_artist({Key? key}) : super(key: key);

//   @override
//   State<mainpage_artist> createState() => _mainpage_artistState();
// }

// class _mainpage_artistState extends State<mainpage_artist> {
//   // static const data = [
//   //   "https://5.imimg.com/data5/SELLER/Default/2022/9/VK/FQ/EG/17769549/ap0015.jpeg",
//   //   "https://5.imimg.com/data5/SELLER/Default/2022/9/RL/ZT/GR/17769549/bkt001-5347-1000x1000.jpeg",
//   //   "https://5.imimg.com/data5/SELLER/Default/2022/9/TE/IH/KW/17769549/bkt00125-1000x1000.jpeg",
//   //   "https://5.imimg.com/data5/SELLER/Default/2022/9/OZ/MM/UW/17769549/bkt0041--1000x1000.jpg"
//   // ];
//   var label=['Home','Page1','Page2','Page3','Page4'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.pinkAccent,
//         // automaticallyImplyLeading: false,
//         title: const Text('Main Page',
//         style: TextStyle(
//       color: Colors.white,
//       fontSize: 30 // Change this to any color you prefer
//     ),),
//      actions: [
//           IconButton(
//             icon: Icon(Icons.notifications_active_outlined, color: Colors.white),
//             onPressed: () => Navigator.pushNamed(context, '/viewnotificationartist'),
//           ),
//         ],
//     iconTheme: IconThemeData(color: Colors.white),
//       ),
//       drawer: draw_artist(),
//       bottomNavigationBar: botnav_artist(),
//       body: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('lib/Asset/about_bg1.jpg'),
//               fit: BoxFit.cover,
//             )
//         ),

//         // child: Padding(
//         //   padding: const EdgeInsets.all(8.0),

//         //   child: GridView.count(
//         //     crossAxisCount: 4,
//         //     childAspectRatio: 0.5,
//         //     children: List.generate(
//         //       data.length,
//         //           (index) => Padding(
//         //         padding: const EdgeInsets.all(5.0),
//         //         child: GestureDetector(
//         //           child: Card(
//         //             child: Column(
//         //               children: [
//         //                 Image.network(data[index]),
//         //                 Padding(
//         //                   padding: const EdgeInsets.all(10.0),
//         //                   child: Text('${label[index]}'),
//         //                 ),
//         //
//         //               ],
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//       ),
//     );
//   }
// }













// import 'package:flutter/material.dart';
// import 'package:glam_me/layout/botnavuser.dart';
// import 'package:glam_me/layout/draw_user.dart';


// class mainpage_user extends StatefulWidget {
//   const mainpage_user({Key? key}) : super(key: key);

//   @override
//   State<mainpage_user> createState() => _mainpage_userState();
// }

// class _mainpage_userState extends State<mainpage_user> {
//   // static const data = [
//   //   "https://5.imimg.com/data5/SELLER/Default/2022/9/VK/FQ/EG/17769549/ap0015.jpeg",
//   //   "https://5.imimg.com/data5/SELLER/Default/2022/9/RL/ZT/GR/17769549/bkt001-5347-1000x1000.jpeg",
//   //   "https://5.imimg.com/data5/SELLER/Default/2022/9/TE/IH/KW/17769549/bkt00125-1000x1000.jpeg",
//   //   "https://5.imimg.com/data5/SELLER/Default/2022/9/OZ/MM/UW/17769549/bkt0041--1000x1000.jpg"
//   // ];
//   var label=['Home','Page1','Page2','Page3','Page4'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//   backgroundColor: Color.fromARGB(255, 238, 25, 96),
  
//   title: const Padding(
//     padding: EdgeInsets.symmetric( vertical: 50,horizontal:10.0),
//     child: Text(
//       'Main Page',
//       style: 
      
//       TextStyle(
//         color: Colors.white,
        
//         fontSize: 30,
        
//          // Change this to any color you prefer
//       ),
//     ),
//   ),
//   actions: [IconButton(
//   icon: const Icon(Icons.notifications_active_outlined,color: Colors.white,),
//   onPressed: () {
//     // Your action goes here
//          Navigator.pushNamed(context, '/viewnotificationuser');

    
//   },
// ),
//   ],
//    iconTheme: IconThemeData(color: Colors.white),

// ),

//       drawer: draw_user(),
//       bottomNavigationBar: botnav_user(),
//       body: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/background.png'),
//               fit: BoxFit.fitWidth,
//             ),
//         ),

//         // child: Padding(
//         //   padding: const EdgeInsets.all(8.0),

//         //   child: GridView.count(
//         //     crossAxisCount: 4,
//         //     childAspectRatio: 0.5,
//         //     children: List.generate(
//         //       data.length,
//         //           (index) => Padding(
//         //         padding: const EdgeInsets.all(5.0),
//         //         child: GestureDetector(
//         //           child: Card(
//         //             child: Column(
//         //               children: [
//         //                 Image.network(data[index]),
//         //                 Padding(
//         //                   padding: const EdgeInsets.all(10.0),
//         //                   child: Text('${label[index]}'),
//         //                 ),
//         //
//         //               ],
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:glam_me/layout/botnavuser.dart';
// import 'package:glam_me/layout/draw_user.dart';

// class mainpage_user extends StatefulWidget {
//   const mainpage_user({Key? key}) : super(key: key);

//   @override
//   State<mainpage_user> createState() => _mainpage_userState();
// }

// class _mainpage_userState extends State<mainpage_user> {
//   final List<String> imageUrls = [
//     "https://5.imimg.com/data5/SELLER/Default/2022/9/VK/FQ/EG/17769549/ap0015.jpeg",
//     "https://5.imimg.com/data5/SELLER/Default/2022/9/RL/ZT/GR/17769549/bkt001-5347-1000x1000.jpeg",
//     "https://5.imimg.com/data5/SELLER/Default/2022/9/TE/IH/KW/17769549/bkt00125-1000x1000.jpeg",
//     "https://5.imimg.com/data5/SELLER/Default/2022/9/OZ/MM/UW/17769549/bkt0041--1000x1000.jpg"
//   ];

//   final List<Map<String, String>> services = [
//     {"title": "Makeup", "desc": "Professional makeup services for all occasions."},
//     {"title": "Mehendi", "desc": "Beautiful mehendi designs for weddings & festivals."},
//     {"title": "Styling", "desc": "Personalized styling and fashion advice."},
//     {"title": "Designer", "desc": "Custom designer outfits and accessories."},
//   ];

//   void showServiceDetails(String title, String description) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text("Close"),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 238, 25, 96),
//         title: Text('Main Page', style: TextStyle(color: Colors.white, fontSize: 30)),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications_active_outlined, color: Colors.white),
//             onPressed: () => Navigator.pushNamed(context, '/viewnotificationuser'),
//           ),
//         ],
//       ),
//       drawer: draw_user(),
//       bottomNavigationBar: botnav_user(),
//       body: Column(
//         children: [
//           // Image Slider
//           CarouselSlider(
//             options: CarouselOptions(height: MediaQuery.of(context).size.height * 0.4, autoPlay: true),
//             items: imageUrls.map((url) {
//               return Container(
//                 margin: EdgeInsets.symmetric(horizontal: 5),
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
//                 ),
//               );
//             }).toList(),
//           ),
//           SizedBox(height: 20),
//           // Service Boxes
//           Expanded(
//             child: GridView.builder(
//               padding: EdgeInsets.all(16),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 1.2,
//               ),
//               itemCount: services.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () => showServiceDetails(services[index]['title']!, services[index]['desc']!),
//                   child: Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     child: Center(
//                       child: Text(
//                         services[index]['title']!,
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }










// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:glam_me/layout/botnavuser.dart';
// import 'package:glam_me/layout/draw_user.dart';

// class mainpage_user extends StatefulWidget {
//   const mainpage_user({Key? key}) : super(key: key);

//   @override
//   State<mainpage_user> createState() => _mainpage_userState();
// }

// class _mainpage_userState extends State<mainpage_user> {
//   final List<String> imageUrls = [
//     "https://5.imimg.com/data5/SELLER/Default/2022/9/VK/FQ/EG/17769549/ap0015.jpeg",
//     "https://5.imimg.com/data5/SELLER/Default/2022/9/RL/ZT/GR/17769549/bkt001-5347-1000x1000.jpeg",
//     "https://5.imimg.com/data5/SELLER/Default/2022/9/TE/IH/KW/17769549/bkt00125-1000x1000.jpeg",
//     "https://5.imimg.com/data5/SELLER/Default/2022/9/OZ/MM/UW/17769549/bkt0041--1000x1000.jpg"
//   ];

//   final List<Map<String, String>> services = [
//     {"title": "Makeup", "desc": "Professional makeup services for all occasions.", "image": "assets/makeup1.jpeg"},
//     {"title": "Mehendi", "desc": "Beautiful mehendi designs for weddings & festivals.", "image": "mehandi1.jpeg"},
//     {"title": "Styling", "desc": "Personalized styling and fashion advice.", "image": "stylist1.jpg"},
//     {"title": "Designer", "desc": "Custom designer outfits and accessories.", "image": "designer11.jpeg"},
//   ];

//   void showServiceDetails(String title, String description) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text("Close"),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 238, 25, 96),
//         title: Text('Main Page', style: TextStyle(color: Colors.white, fontSize: 30)),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications_active_outlined, color: Colors.white),
//             onPressed: () => Navigator.pushNamed(context, '/viewnotificationuser'),
//           ),
//         ],
//       ),
//       drawer: draw_user(),
//       bottomNavigationBar: botnav_user(),
//       body: Column(
//         children: [
//           // Image Slider
//           CarouselSlider(
//             options: CarouselOptions(height: MediaQuery.of(context).size.height * 0.4, autoPlay: true),
//             items: imageUrls.map((url) {
//               return Container(
//                 margin: EdgeInsets.symmetric(horizontal: 5),
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
//                 ),
//               );
//             }).toList(),
//           ),
//           SizedBox(height: 20),
//           // Service Boxes
//           Expanded(
//             child: GridView.builder(
//               padding: EdgeInsets.all(16),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 1.2,
//               ),
//               itemCount: services.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () => showServiceDetails(services[index]['title']!, services[index]['desc']!),
//                   child: Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.network(services[index]['image']!, height: 100, fit: BoxFit.cover),
//                         SizedBox(height: 10),
//                         Text(
//                           services[index]['title']!,
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:glam_me/layout/botnavartist.dart';
import 'package:glam_me/layout/botnavuser.dart';
import 'package:glam_me/layout/draw_artist.dart';
import 'package:glam_me/layout/draw_user.dart';

class mainpage_artist extends StatefulWidget {
  const mainpage_artist({Key? key}) : super(key: key);

  @override
  State<mainpage_artist> createState() => _mainpage_artistState();
}

class _mainpage_artistState extends State<mainpage_artist> {
  final List<String> imageUrls = [
    "assets/makeup1.jpeg",
    "assets/mehandi1.jpeg",
    "assets/stylist1.jpg",
    "assets/designer11.jpeg"
  ];

  final List<Map<String, String>> services = [
    {"title": "Makeup", "desc": "Professional makeup services for all occasions.", "image": "assets/makeup1.jpeg"},
    {"title": "Mehendi", "desc": "Beautiful mehendi designs for weddings & festivals.", "image": "assets/mehandi1.jpeg"},
    {"title": "Styling", "desc": "Personalized styling and fashion advice.", "image": "assets/stylist1.jpg"},
    {"title": "Designer", "desc": "Custom designer outfits and accessories.", "image": "assets/designer11.jpeg"},
  ];

  void showServiceDetails(String title, String description) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 25, 96),
        title: Text('Main Page', style: TextStyle(color: Colors.white, fontSize: 30)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_outlined, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/viewnotificationartist'),
          ),
        ],
            iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: draw_artist(),
      bottomNavigationBar: botnav_artist(),
      body: Column(
        children: [
          SizedBox(height: 35,),
          // Image Slider
          CarouselSlider(
            options: CarouselOptions(height: MediaQuery.of(context).size.height * 0.4, autoPlay: true),
            items: imageUrls.map((url) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 30,),
          SizedBox(height: 70, child: Text("Our Services",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),),
          // Service Boxes
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2,
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => showServiceDetails(services[index]['title']!, services[index]['desc']!),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(services[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Center(
                        child: Text(
                          services[index]['title']!,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.7),
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
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

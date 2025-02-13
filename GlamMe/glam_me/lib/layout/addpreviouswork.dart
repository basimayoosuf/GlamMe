import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavartist.dart';
import 'package:glam_me/layout/draw_artist.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
class addpreviouswork extends StatefulWidget {
  const addpreviouswork({Key? key}) : super(key: key);

  @override
  State<addpreviouswork> createState() => _addpreviousworkState();
}

class _addpreviousworkState extends State<addpreviouswork> {
  late TextEditingController image;
  var file,objfile;
  @override
  void initState(){
    image=TextEditingController();
    super.initState();
  }
   void postdata()async{
     var url=Uri.parse(login.url+"previous_work/%20previous_work/");
    var resp=await post(url,body:{
      'image':image.text.toString(),
      'uid':login.uid,

    });
  
final request = MultipartRequest(
    "POST", Uri.parse(login.url+"/previous_work/uploadwrk/"));
  request.fields["id"] = "bus";
  request.files.add(MultipartFile( 
    file,objfile.readStream,objfile.size,filename:objfile.name));
  var resp1= await request.send();
  final respstr = await resp1.stream.bytesToString();

  }


upload_work()async{
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw_artist(),
      bottomNavigationBar: botnav_artist(),
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add previous work', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      iconTheme: IconThemeData(color: Colors.white),
      ),
   body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              // 
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
      upload_work();
    },
    child: Text(
      'Upload your previous works',
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
                child: ElevatedButton(
                  onPressed: () {
                    postdata();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context)=> addpreviouswork()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(223, 26, 158, 163),
                  ),
                  child: Text("Post"),
                ),
              ),

            ],) ),
        ),
      ),   
    );
  }
}
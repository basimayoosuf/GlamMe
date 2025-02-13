import 'package:flutter/material.dart';
import 'package:glam_me/layout/botnavuser.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/login.dart';
import 'package:http/http.dart';
class addpayment extends StatefulWidget {
  const addpayment({Key? key}) : super(key: key);

  @override
  State<addpayment> createState() => _addpaymentState();
  static String pid="",amt="";
}

class _addpaymentState extends State<addpayment> {
  late TextEditingController amount,method,cvv,cardholder_name;
  @override
  void initState(){
    amount=TextEditingController();
    method=TextEditingController();
    cvv=TextEditingController();
    amount.text=addpayment.amt;
    cardholder_name=TextEditingController();
    super.initState();
  }
  void postdata()async{
     var url=Uri.parse(login.url+"payment/payment/");
    var resp=await post(url,body:{
      'amount':amount.text.toString(),
      'method':method.text.toString(),
      'cvv':cvv.text.toString(),
      'cardholder_name':cardholder_name.text.toString(),
      "pid":addpayment.pid,
      "uid":login.uid
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw_user(),
      bottomNavigationBar: botnav_user(),
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add payment', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      iconTheme: IconThemeData(color: Colors.white),
      ),
    body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: amount,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    hintText: 'amount',
                    prefixIcon: Icon(Icons.currency_rupee),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: method,
                  decoration: InputDecoration(
                    labelText: 'Method',
                    hintText: 'method',
                    prefixIcon: Icon(Icons.payment),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: cvv,
                  decoration: InputDecoration(
                    labelText: 'Cvv',
                    hintText: 'cvv',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  controller: cardholder_name,
                  decoration: InputDecoration(
                    labelText: 'Cardholder name',
                    hintText: 'cardholder name',
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
                Container(
                padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                child: ElevatedButton(
                  onPressed: () {
                    postdata();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context)=> addpayment()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(223, 26, 158, 163),
                  ),
                  child: Text("Pay"),
                ),
              ),
              

            ],) ),
        ),
      ),   
    
    );

  }
}
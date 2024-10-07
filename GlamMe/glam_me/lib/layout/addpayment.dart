import 'package:flutter/material.dart';
import 'package:http/http.dart';
class addpayment extends StatefulWidget {
  const addpayment({Key? key}) : super(key: key);

  @override
  State<addpayment> createState() => _addpaymentState();
}

class _addpaymentState extends State<addpayment> {
  late TextEditingController amount,method,cvv,cardholder_name;
  @override
  void initState(){
    amount=TextEditingController();
    method=TextEditingController();
    cvv=TextEditingController();
    cardholder_name=TextEditingController();
    super.initState();
  }
  void postdata()async{
    String url="";
    var resp=await post(url,body:{
      'amount':amount.text.toString(),
      'method':method.text.toString(),
      'cvv':cvv.text.toString(),
      'cardholder_name':cardholder_name.text.toString(),

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.pinkAccent , 
      title: Text('Add payment', style:new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
    body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    hintText: 'amount',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Method',
                    hintText: 'method',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: TextFormField(
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
                  decoration: InputDecoration(
                    labelText: 'Cardholder name',
                    hintText: 'cardholder name',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
                Container(
                padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context)=> addpayment()));
                    
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(223, 26, 158, 163),
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
import 'package:flutter/material.dart';
import 'package:glam_me/layout/addcomplaintartist.dart';
import 'package:glam_me/layout/addcomplaintuser.dart';
import 'package:glam_me/layout/addoffer.dart';
import 'package:glam_me/layout/addpayment.dart';
import 'package:glam_me/layout/addpreviouswork.dart';
import 'package:glam_me/layout/addrating.dart';
import 'package:glam_me/layout/addservice.dart';
import 'package:glam_me/layout/artistreg.dart';
import 'package:glam_me/layout/login.dart';
import 'package:glam_me/layout/suggestion.dart';
import 'package:glam_me/layout/userreg.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => artistreg()
    },
  ));
}
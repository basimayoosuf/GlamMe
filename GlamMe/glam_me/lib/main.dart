import 'package:flutter/material.dart';
import 'package:glam_me/layout/addcomplaintartist.dart';
import 'package:glam_me/layout/addcomplaintuser.dart';
import 'package:glam_me/layout/addoffer.dart';
import 'package:glam_me/layout/addpayment.dart';
import 'package:glam_me/layout/addpreviouswork.dart';
import 'package:glam_me/layout/addrating.dart';
import 'package:glam_me/layout/addservice.dart';
import 'package:glam_me/layout/artistreg.dart';
import 'package:glam_me/layout/bookservices.dart';
import 'package:glam_me/layout/botnavartist.dart';
import 'package:glam_me/layout/draw_artist.dart';
import 'package:glam_me/layout/draw_user.dart';
import 'package:glam_me/layout/login.dart';
import 'package:glam_me/layout/mainpageartist.dart';
import 'package:glam_me/layout/mainpageuser.dart';
import 'package:glam_me/layout/mybooking.dart';
import 'package:glam_me/layout/suggestion.dart';
import 'package:glam_me/layout/updateprofileartist.dart';
import 'package:glam_me/layout/updateworkstatus.dart';
import 'package:glam_me/layout/userprofile.dart';
import 'package:glam_me/layout/userreg.dart';
import 'package:glam_me/layout/view_rating.dart';
import 'package:glam_me/layout/viewartist.dart';
import 'package:glam_me/layout/viewassignedwork.dart';
import 'package:glam_me/layout/viewnotificationartist.dart';
import 'package:glam_me/layout/viewnotificationuser.dart';
import 'package:glam_me/layout/viewoffer.dart';
import 'package:glam_me/layout/viewpaymentart.dart';
import 'package:glam_me/layout/viewpreviouswork.dart';
import 'package:glam_me/layout/viewreplyartist.dart';
import 'package:glam_me/layout/viewreplyuser.dart';
import 'package:glam_me/layout/viewserviceuser.dart';



void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => login(),
      '/addcomplaintartist':(context) => addcomplaintartist(),
      '/addcomplaintuser':(context) => addcomplaintuser(),
      '/addoffer':(context) => addoffer(),
      '/addpayment':(context) => addpayment(),
      '/addpreviouswork':(context) => addpreviouswork(),
      '/addrating':(context) => addrating(),
      '/addservice':(context) => addservice(),
      '/artistreg':(context) => artistreg(),
      '/bookservices':(context) => bookservices(),
      '/suggestion':(context) => suggestion(),
      '/userreg':(context) => userreg(),
      '/viewartist':(context) => view_artist(),
      '/viewassignedwork':(context) => view_assignedwork(),
      '/viewnotificationartist':(context) => view_notificationartist(),
      '/viewnotificationuser':(context) => view_notificationuser(),
      '/viewoffer':(context) => view_offer(),
      '/viewpaymentart':(context) => view_paymentart(),
      '/viewpreviouswork':(context) => view_previouswork(),
      '/viewreplyartist':(context) => view_replyartist(),
      '/viewreplyuser':(context) => view_replyuser(),
      '/viewserviceuser':(context) => view_serviceuser(),
      '/mybooking':(context) => mybooking(),
      '/updateprofileartist':(context) => updateprofileartist(),
      '/updateworkstatus':(context) => update_worksts(),
      '/view_rating':(context) => view_rating(),
      '/userprofile':(context) => userprofile(userId: '',),

      '/main':(context) => mainpage_user(),
      '/main___':(context) => mainpage_artist(),


  

    },
  ));
}
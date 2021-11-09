import 'dart:async';

import 'package:blog_app/main.dart';
import 'package:blog_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class VerifyScreen extends StatefulWidget {
  const VerifyScreen({ Key? key }) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {


  final auth = FirebaseAuth.instance;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    final user = auth.currentUser;
    user!.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) { 
      checkEmailVerified();
    });
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    return Scaffold(
      appBar:AppBar(
        title: Text("Email Verification"),
      ),
      body: Center(
        child: Text("An Email has been sent to ${user!.email} for verification"),
      ),
    );
  }


  Future<void> checkEmailVerified() async{
    final user = auth.currentUser;
    await user!.reload();
    if(user.emailVerified)
    {
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
    }


  }


}
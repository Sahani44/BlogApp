
import 'package:blog_app/pages/login_page.dart';
import 'package:blog_app/pages/sign_up_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInProvider extends ChangeNotifier
{

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogIn() async
  {
    try{
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  } catch(e){
    print(e.toString());
  }

    notifyListeners();

  }

  Future logout() async{

    final user =  FirebaseAuth.instance.currentUser!;

    if(user.providerData[0].providerId == 'google.com')
    {await googleSignIn.disconnect();}
    FirebaseAuth.instance.signOut();



  }

}
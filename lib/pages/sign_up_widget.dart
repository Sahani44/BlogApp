import 'package:blog_app/pages/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'email_sign_in.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.book),
        title: Text("BDCoE Blogs"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Spacer(),
            //Image.asset(),
            Image.asset(
                "assets/images/startPageImage.png",
                fit: BoxFit.cover,
              ),
            //Spacer(),
            SizedBox(
                height: 20.0,
                //child: Text(""),
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hey There,\nWelcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login to your account to continue',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,50),),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmailLoginPage()));
              }, 
              label :Text('Log In/Sign Up'),
              icon: Icon(Icons.login),
              ),
            SizedBox(height: 10,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,50),),
              onPressed: (){
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogIn();
              }, 
              label: Text('Sign Up with Google'),
              icon: FaIcon(FontAwesomeIcons.google,color:Colors.white),
              ),
            SizedBox(height: 40,),
            /*RichText(
              text: TextSpan(
                text: 'Already have an account ?',style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Log in',
                    style: TextStyle(decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),*/
            Spacer(),
          ],
        ),
      ),
    );
  }
}
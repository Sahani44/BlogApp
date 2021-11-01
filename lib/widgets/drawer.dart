import 'package:blog_app/pages/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyDrawer extends StatelessWidget {
  MyDrawer({ Key? key }) : super(key: key);
  final user =  FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding : EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text(user.displayName!),
                accountEmail: Text(user.email!),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.eject,color: Colors.blue),
              title: Text("Log Out",
                style: TextStyle(fontSize: 15,color: Colors.blue),
              ),
              onTap: (){
                final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                provider.logout();
              },
            ),
          ],
        )
        
      ),
    );
  }
}
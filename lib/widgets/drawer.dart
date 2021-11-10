
import 'package:blog_app/pages/google_sign_in.dart';
import 'package:blog_app/pages/update_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyDrawer extends StatefulWidget {
  //String? imageUrl = FirebaseAuth.instance.currentUser!.photoURL;
  
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final user =  FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          TextButton.icon(
            onPressed: ()async {
                await Navigator.push(context,MaterialPageRoute(builder: (context) => UpdateProfile())).then((value) => {
                  setState((){})
                });
              },
            icon: Icon(Icons.person,color: Colors.blue,), 
            label: Text("Update Profile",style: TextStyle(color: Colors.blue,fontSize: 17,),)
          ),
          TextButton.icon(
              label: Text("Log Out",style: TextStyle(color:Colors.blue,fontSize: 17),),
              onPressed: () async {
                final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                await provider.logout();
              }, 
              icon: Icon(Icons.logout,color: Colors.blue,),
            ),
        ],
      ),
    );
  }
}
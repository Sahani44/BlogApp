import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  MyDrawer({ Key? key }) : super(key: key);
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
        ],
      ),
    );
  }
}
import 'package:blog_app/blog_categories/webDev/blog_listwd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrsnlBlogListWeb extends StatefulWidget {
  const PrsnlBlogListWeb({ Key? key }) : super(key: key);

  @override
  _PrsnlBlogListWebState createState() => _PrsnlBlogListWebState();
}

class _PrsnlBlogListWebState extends State<PrsnlBlogListWeb> {

  @override
  Widget build(BuildContext context) {

    final blogSnapshot = Provider.of<QuerySnapshot?>(context);
    final user =  FirebaseAuth.instance.currentUser!;
    bool edit = true;

    return blogSnapshot !=null
    ? ListView.builder(
      itemCount: blogSnapshot.docs.length,
      itemBuilder: (context,index){
        if(blogSnapshot.docs[index].get('email').toString() == user.email)
        {
          return Padding(
          padding: const EdgeInsets.all(10.0),
            child: BlogsTileWeb(
              authorName: blogSnapshot.docs[index].get('authorName').toString(),
              title: blogSnapshot.docs[index].get('title').toString(),
              description: blogSnapshot.docs[index].get('description').toString(),
              imageurl: blogSnapshot.docs[index].get('imageUrl').toString(),
              edit: edit,
              blogId: blogSnapshot.docs[index].id
            ),
          );
        }
        else
        {
          return SizedBox(
            height: 0,
            width: 0,
          );
        }
      },
    )
    : Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
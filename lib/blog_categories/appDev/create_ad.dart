
import 'package:blog_app/blog_categories/aiml/prnl_blog_list.dart';
import 'package:blog_app/blog_categories/appDev/create_newad.dart';
import 'package:blog_app/blog_categories/appDev/prnl_blog_listad.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateAd extends StatefulWidget {
  const CreateAd({ Key? key }) : super(key: key);

  @override
  _CreateAdState createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
        value: CrudMethods().getAdData,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: Text("App Dev Blogs"),
          ),
          body: PrsnlBlogListAd(),
          floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNad()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:blog_app/blog_categories/aiml/prnl_blog_list.dart';
import 'package:blog_app/blog_categories/java/create_newja.dart';
import 'package:blog_app/blog_categories/java/prnl_blog_listja.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateJa extends StatefulWidget {
  const CreateJa({ Key? key }) : super(key: key);

  @override
  _CreateJaState createState() => _CreateJaState();
}

class _CreateJaState extends State<CreateJa> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
        value: CrudMethods().getJaData,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: Text("AI/ML Blogs"),
          ),
          body: PrsnlBlogListJa(),
          floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNja()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
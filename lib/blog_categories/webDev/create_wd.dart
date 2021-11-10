
import 'package:blog_app/blog_categories/aiml/prnl_blog_list.dart';
import 'package:blog_app/blog_categories/webDev/create_newwd.dart';
import 'package:blog_app/blog_categories/webDev/prnl_blog_listwd.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateWeb extends StatefulWidget {
  const CreateWeb({ Key? key }) : super(key: key);

  @override
  _CreateWebState createState() => _CreateWebState();
}

class _CreateWebState extends State<CreateWeb> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
        value: CrudMethods().getWebData,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Web Dev Blogs"),
          ),
          body: PrsnlBlogListWeb(),
          floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNweb()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
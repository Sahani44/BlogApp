
import 'package:blog_app/blog_categories/aiml/create_newam.dart';
import 'package:blog_app/blog_categories/aiml/prnl_blog_list.dart';
import 'package:blog_app/blog_categories/webDev/create_newwd.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateAM extends StatefulWidget {
  const CreateAM({ Key? key }) : super(key: key);

  @override
  _CreateAMState createState() => _CreateAMState();
}

class _CreateAMState extends State<CreateAM> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
        value: CrudMethods().getWebData,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Web Dev Blogs"),
          ),
          body: PrsnlBlogList(),
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
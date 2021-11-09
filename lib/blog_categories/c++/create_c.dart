
import 'package:blog_app/blog_categories/aiml/create_newam.dart';
import 'package:blog_app/blog_categories/aiml/prnl_blog_list.dart';
import 'package:blog_app/blog_categories/c++/create_newam.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateCp extends StatefulWidget {
  const CreateCp({ Key? key }) : super(key: key);

  @override
  _CreateCpState createState() => _CreateCpState();
}

class _CreateCpState extends State<CreateCp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
        value: CrudMethods().getCpData,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: Text("CPP Blogs"),
          ),
          body: PrsnlBlogList(),
          floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNcp()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
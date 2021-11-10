
import 'package:blog_app/blog_categories/aiml/create_newam.dart';
import 'package:blog_app/blog_categories/aiml/prnl_blog_list.dart';
import 'package:blog_app/blog_categories/designing/create_newdes.dart';
import 'package:blog_app/blog_categories/designing/prnl_blog_listdes.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateDes extends StatefulWidget {
  const CreateDes({ Key? key }) : super(key: key);

  @override
  _CreateDesState createState() => _CreateDesState();
}

class _CreateDesState extends State<CreateDes> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
        value: CrudMethods().getDesData,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Designing Blogs"),
          ),
          body: PrsnlBlogListDes(),
          floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNdes()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
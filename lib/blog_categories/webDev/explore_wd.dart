import 'package:blog_app/blog_categories/aiml/blog_list.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ExploreWeb extends StatefulWidget {
  const ExploreWeb({ Key? key }) : super(key: key);

  @override
  _ExploreWebState createState() => _ExploreWebState();
}

class _ExploreWebState extends State<ExploreWeb> {

  CrudMethods crudMethods = CrudMethods();
   

 /* Widget blogList(){
    final blogSnapshot = Provider.of<QuerySnapshot?>(context);
    return 
  }*/

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: CrudMethods().getWebData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Web Dev Blogs"),
        ),
        body: BlogList(),
      ),
    );
  }
}


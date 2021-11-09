import 'package:blog_app/blog_categories/aiml/blog_list.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ExploreJa extends StatefulWidget {
  const ExploreJa({ Key? key }) : super(key: key);

  @override
  _ExploreJaState createState() => _ExploreJaState();
}

class _ExploreJaState extends State<ExploreJa> {

  CrudMethods crudMethods = CrudMethods();
   

 /* Widget blogList(){
    final blogSnapshot = Provider.of<QuerySnapshot?>(context);
    return 
  }*/

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: CrudMethods().getJaData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Java Blogs"),
        ),
        body: BlogList(),
      ),
    );
  }
}


import 'package:blog_app/blog_categories/aiml/blog_list.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ExploreDes extends StatefulWidget {
  const ExploreDes({ Key? key }) : super(key: key);

  @override
  _ExploreDesState createState() => _ExploreDesState();
}

class _ExploreDesState extends State<ExploreDes> {

  CrudMethods crudMethods = CrudMethods();
   

 /* Widget blogList(){
    final blogSnapshot = Provider.of<QuerySnapshot?>(context);
    return 
  }*/

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: CrudMethods().getDesData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Designing Blogs"),
        ),
        body: BlogList(),
      ),
    );
  }
}


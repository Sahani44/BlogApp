import 'package:blog_app/blog_categories/aiml/blog_list.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ExploreGit extends StatefulWidget {
  const ExploreGit({ Key? key }) : super(key: key);

  @override
  _ExploreGitState createState() => _ExploreGitState();
}

class _ExploreGitState extends State<ExploreGit> {

  CrudMethods crudMethods = CrudMethods();
   

 /* Widget blogList(){
    final blogSnapshot = Provider.of<QuerySnapshot?>(context);
    return 
  }*/

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: CrudMethods().getGitData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Git Blogs"),
        ),
        body: BlogList(),
      ),
    );
  }
}


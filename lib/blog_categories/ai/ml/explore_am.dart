import 'package:blog_app/blog_categories/ai/ml/blog_list.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ExploreAm extends StatefulWidget {
  const ExploreAm({ Key? key }) : super(key: key);

  @override
  _ExploreAmState createState() => _ExploreAmState();
}

class _ExploreAmState extends State<ExploreAm> {

  CrudMethods crudMethods = CrudMethods();
   

 /* Widget blogList(){
    final blogSnapshot = Provider.of<QuerySnapshot?>(context);
    return 
  }*/

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: CrudMethods().getData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AI/ML Blogs"),
        ),
        body: BlogList(),
      ),
    );
  }
}


import 'package:blog_app/blog_categories/aiml/blog_list.dart';
import 'package:blog_app/blog_categories/c++/blog_listcp.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ExploreCp extends StatefulWidget {
  const ExploreCp({ Key? key }) : super(key: key);

  @override
  _ExploreCpState createState() => _ExploreCpState();
}

class _ExploreCpState extends State<ExploreCp> {

  CrudMethods crudMethods = CrudMethods();
   

 /* Widget blogList(){
    final blogSnapshot = Provider.of<QuerySnapshot?>(context);
    return 
  }*/

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: CrudMethods().getCpData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("CPP Blogs"),
        ),
        body: BlogListCp(),
      ),
    );
  }
}


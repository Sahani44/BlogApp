import 'package:blog_app/blog_categories/appDev/blog_listad.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ExploreApp extends StatefulWidget {
  const ExploreApp({ Key? key }) : super(key: key);

  @override
  _ExploreAppState createState() => _ExploreAppState();
}

class _ExploreAppState extends State<ExploreApp> {

  CrudMethods crudMethods = CrudMethods();
   

 /* Widget blogList(){
    final blogSnapshot = Provider.of<QuerySnapshot?>(context);
    return 
  }*/

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: CrudMethods().getAdData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("App Dev Blogs"),
        ),
        body: BlogListAd(),
      ),
    );
  }
}


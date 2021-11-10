
import 'package:blog_app/blog_categories/aiml/create_newam.dart';
import 'package:blog_app/blog_categories/aiml/prnl_blog_list.dart';
import 'package:blog_app/blog_categories/git/create_newgit.dart';
import 'package:blog_app/blog_categories/git/prnl_blog_listgit.dart';
import 'package:blog_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateGit extends StatefulWidget {
  const CreateGit({ Key? key }) : super(key: key);

  @override
  _CreateGitState createState() => _CreateGitState();
}

class _CreateGitState extends State<CreateGit> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
        value: CrudMethods().getGitData,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Git Blogs"),
          ),
          body: PrsnlBlogListGit(),
          floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNgit()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
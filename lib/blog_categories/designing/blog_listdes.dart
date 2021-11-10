import 'package:blog_app/blog_categories/designing/blog_pagedes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogListDes extends StatefulWidget {
  const BlogListDes({ Key? key }) : super(key: key);

  @override
  _BlogListDesState createState() => _BlogListDesState();
}

class _BlogListDesState extends State<BlogListDes> {
  @override
  Widget build(BuildContext context) {

    final blogSnapshot = Provider.of<QuerySnapshot?>(context);
    bool edit = false;

/*    if(blogSnapshot == null)
    {
      return Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
    }
    else{
      for(var doc in blogSnapshot.docs){
       print(doc.data());
    }
    }
*/

    return blogSnapshot !=null
    ? ListView.builder(
      itemCount: blogSnapshot.docs.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlogsTileDes(
            authorName: blogSnapshot.docs[index].get('authorName').toString(),
            title: blogSnapshot.docs[index].get('title').toString(),
            description: blogSnapshot.docs[index].get('description').toString(),
            imageurl: blogSnapshot.docs[index].get('imageUrl').toString(),
            edit: edit,
            blogId: blogSnapshot.docs[index].id,
          ),
        );
      },
    )
    : Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}


class BlogsTileDes extends StatelessWidget {
  
  String imageurl = "",title = "",description = "",authorName = "",blogId = "";bool edit;

  BlogsTileDes({required this.imageurl,required this.title,required this.description,required this.authorName,required this.edit,required this.blogId});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => BlogPageDes(title: title,desc:description,imageUrl: imageurl,edit:edit,blogId:blogId)));
        },
        child: Stack(
          children: [
            SizedBox(
              height: 150,width: MediaQuery.of(context).size.width,
              child: ClipRRect(child: Image.network(imageurl,height: 150,fit:BoxFit.fitWidth),borderRadius: BorderRadius.circular(6))),
            Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.black45.withOpacity(0.3),borderRadius: BorderRadius.circular(6)),
            ),
            Column(
              children: [
                Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                Text("By $authorName",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          
              ],
            )
          ],
        ),
      ),
    );
  }
}
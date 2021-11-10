import 'package:blog_app/blog_categories/c++/blog_pagecp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogListCp extends StatefulWidget {
  const BlogListCp({ Key? key }) : super(key: key);

  @override
  _BlogListCpState createState() => _BlogListCpState();
}

class _BlogListCpState extends State<BlogListCp> {
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
          child: BlogsTileCp(
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


class BlogsTileCp extends StatelessWidget {
  
  String imageurl = "",title = "",description = "",authorName = "",blogId = "";bool edit;

  BlogsTileCp({required this.imageurl,required this.title,required this.description,required this.authorName,required this.edit,required this.blogId});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => BlogPageCp(title: title,desc:description,imageUrl: imageurl,edit:edit,blogId:blogId)));
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
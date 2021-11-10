import 'dart:io';

import 'package:blog_app/services/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';


class BlogPageWeb extends StatefulWidget {
  String desc = "",imageUrl = "",title = "",blogId; bool edit;

  BlogPageWeb({ required this.desc,required this.imageUrl,required this.title,required this.blogId,required this.edit });

  @override
  State<BlogPageWeb> createState() => _BlogPageWebState(title: title,desc:desc,imageUrl: imageUrl,edit:edit,blogId:blogId);
}

class _BlogPageWebState extends State<BlogPageWeb> {
  bool edit;

  String blogId = "",desc = "",imageUrl = "",title = "";
  var downloadUrl;var file;
  

  final _formKey = GlobalKey<FormState>();
  final user =  FirebaseAuth.instance.currentUser!;

  CrudMethods crudMethods = CrudMethods();

  


  _BlogPageWebState({ required this.desc,required this.imageUrl,required this.title,required this.blogId,required this.edit });


  getImage() async{

    final _storage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    XFile? image;

    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
    var snapshot = await _storage.ref().child("WebBlogImages").child("${randomAlphaNumeric(9)}.png").putFile(file);
    downloadUrl = await snapshot.ref.getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }


  updateBlog() async {
    if(_formKey.currentState!.validate() && imageUrl !="")
    {
        Map<String , String> blogMap = {
          "imageUrl": imageUrl,
          "authorName":user.displayName as String,
          "title": title,
          "description": desc,
          "email":user.email.toString()
        };
        
        crudMethods.updateWebData(blogMap,blogId).then((result) {
          Navigator.pop(context);
        });
    }
  }


  @override
  Widget build(BuildContext context) {
    if(edit == false)
    {
      return Scaffold(
      appBar: AppBar(
        title: Text("Web Dev Blogs"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(widget.imageUrl,fit: BoxFit.cover,)),
              height: 150,width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.desc),
              ],
            )
          ]
        )
      )
    );
    }
    else{
      return Scaffold(
        appBar: AppBar(
          title: Text("Edit your blog"),
          actions: [
            GestureDetector(
              onTap: (){
                updateBlog();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.file_upload),
              ),
            ),
          ],
        ),
        body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                getImage();
              },
              child:Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageUrl,fit: BoxFit.cover,)),
                  height: 150,width: MediaQuery.of(context).size.width,
                ) ,
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                  child: Column(
                    children: [
                    
                     TextFormField(
                        initialValue: title,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: "Title",
                      labelText: "Title of the Blog",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Blog title cannot be Empty";
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState(() {
                        title = value.trim();
                      });
                    },
                  ),
                  TextFormField(
                    initialValue: desc,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Description cannot be Empty";
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState(() {
                        desc = value.trim();
                      });
                    },
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: "Enter Description of the Blog",
                      labelText: "Description",
                    ),
                  ),
                    ]
              ),
              ),
            ),
          ]
        )
      )
      );
    }
  }
}
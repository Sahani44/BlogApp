import 'dart:io';

import 'package:blog_app/services/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';



class CreateNweb extends StatefulWidget {
  const CreateNweb({ Key? key }) : super(key: key);

  @override
  _CreateNwebState createState() => _CreateNwebState();
}

class _CreateNwebState extends State<CreateNweb> {

  String authorName = "" , title = "", desc = "";
  final _formKey = GlobalKey<FormState>();
  final user =  FirebaseAuth.instance.currentUser!;

  CrudMethods crudMethods = CrudMethods();
  

  String imageUrl = "";
  var file;
  var downloadUrl;

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


  uploadBlog() async {
    if(_formKey.currentState!.validate() && imageUrl !="")
    {
        Map<String , String> blogMap = {
          "imageUrl": downloadUrl,
          "authorName":user.displayName as String,
          "title": title,
          "description": desc,
          "email":user.email.toString()
        };
        
        crudMethods.addWebData(blogMap).then((result) {
          Navigator.pop(context);
        });
    }
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web Dev Blogs"),
        actions: [
          GestureDetector(
            onTap: (){
              uploadBlog();
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
              child: imageUrl != "" ? 
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageUrl,fit: BoxFit.cover,)),
                  height: 150,width: MediaQuery.of(context).size.width,
                ) 
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10)
                ),
                height: 150,width: MediaQuery.of(context).size.width,
                child: Icon(Icons.add_a_photo,color: Colors.black,),
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                  child: Column(
                    children: [
                    
                     TextFormField(
                        
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
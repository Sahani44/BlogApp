import 'dart:io';

import 'package:blog_app/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({ Key? key }) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  final _formKey = GlobalKey<FormState>();
  final user =  FirebaseAuth.instance.currentUser!;

  String imageUrl = "",name = "";
  var file;
  var downloadUrl;


  getImage() async{

    final _storage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    XFile? image;

    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
    var snapshot = await _storage.ref().child("UserDp").child("${randomAlphaNumeric(9)}.png").putFile(file);
    downloadUrl = await snapshot.ref.getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }

  updateProfile() async {
    if( name != "" || imageUrl != "")
    {
        /*Map<String , String> blogMap = {
          "imageUrl": downloadUrl,
          "authorName":user.displayName as String,
          "title": title,
          "description": desc,
          "email":user.email.toString()
        };
        
        crudMethods.addData(blogMap).then((result) {
          Navigator.pop(context);
        });*/
        if(name != "")
        {await user.updateDisplayName(name);}
        if(imageUrl != "")
        {await user.updatePhotoURL(imageUrl);}
        Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
        actions: [
          GestureDetector(
            onTap: (){
              updateProfile();
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
                      hintText: "Name",
                      labelText: "Name of the User",
                    ),
                    /*validator: (value){
                      if(value!.isEmpty){
                        return "Blog title cannot be Empty";
                      }
                      return null;
                    },*/
                    onChanged: (value){
                      setState(() {
                        name = value.trim();
                      });
                    },
                  ),
                  /*TextFormField(
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
                  ),*/
                  ]
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}
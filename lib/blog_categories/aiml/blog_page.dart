import 'package:flutter/material.dart';


class BlogPage extends StatelessWidget {
  String desc = "";String imageUrl = "";String title = "";bool edit;


  

  BlogPage({ required this.desc,required this.imageUrl,required this.title,required this.edit });

  @override
  Widget build(BuildContext context) {
    if(edit == false)
    {
      return Scaffold(
        appBar: AppBar(
          title: Text("AI/Ml Blogs"),
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
                  child: Image.network(imageUrl,fit: BoxFit.cover,)),
                height: 150,width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(desc),
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
        ),
      );
    }
  }
}
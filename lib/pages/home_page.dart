
import 'package:blog_app/blog_categories/aiml/create_am.dart';
import 'package:blog_app/blog_categories/aiml/explore_am.dart';
import 'package:blog_app/blog_categories/appDev/create_ad.dart';
import 'package:blog_app/blog_categories/appDev/explore_ad.dart';
import 'package:blog_app/blog_categories/c++/create_c.dart';
import 'package:blog_app/blog_categories/c++/explore_cp.dart';
import 'package:blog_app/blog_categories/designing/create_des.dart';
import 'package:blog_app/blog_categories/designing/explore_des.dart';
import 'package:blog_app/blog_categories/git/create_git.dart';
import 'package:blog_app/blog_categories/git/explore_git.dart';
import 'package:blog_app/blog_categories/java/create_ja.dart';
import 'package:blog_app/blog_categories/java/explore_ja.dart';
import 'package:blog_app/blog_categories/webDev/create_wd.dart';
import 'package:blog_app/blog_categories/webDev/explore_wd.dart';
import 'package:blog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.book),
        title: Text("BDCoE Blogs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical:2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("AI/ML",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ExploreAm()));}, child: Text("Explore",style: TextStyle(color: Colors.white),)),
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CreateAM()));}, child: Text("Create",style: TextStyle(color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ),
                color: Colors.blue[400],
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical:2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Web Dev",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ExploreWeb()));}, child: Text("Explore",style: TextStyle(color: Colors.white),)),
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CreateWeb()));}, child: Text("Create",style: TextStyle(color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ),
                color: Colors.blue[400],
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical:2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("App Dev",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ExploreApp()));}, child: Text("Explore",style: TextStyle(color: Colors.white),)),
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CreateAd()));}, child: Text("Create",style: TextStyle(color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ),
                color: Colors.blue[400],
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical:2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Designing",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ExploreDes()));}, child: Text("Explore",style: TextStyle(color: Colors.white),)),
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CreateDes()));}, child: Text("Create",style: TextStyle(color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ),
                color: Colors.blue[400],
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical:2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Git",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ExploreGit()));}, child: Text("Explore",style: TextStyle(color: Colors.white),)),
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CreateGit()));}, child: Text("Create",style: TextStyle(color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ),
                color: Colors.blue[400],
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical:2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Java",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ExploreJa()));}, child: Text("Explore",style: TextStyle(color: Colors.white),)),
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CreateJa()));}, child: Text("Create",style: TextStyle(color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ),
                color: Colors.blue[400],
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical:2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CPP",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ExploreCp()));}, child: Text("Explore",style: TextStyle(color: Colors.white),)),
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CreateCp()));}, child: Text("Create",style: TextStyle(color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ),
                color: Colors.blue[400],
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical:2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Miscellaneous",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){}, child: Text("Explore",style: TextStyle(color: Colors.white),)),
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),onPressed: (){}, child: Text("Create",style: TextStyle(color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ),
                color: Colors.blue[400],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
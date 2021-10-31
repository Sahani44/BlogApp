
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
      drawer: Drawer(),
    );
  }
}
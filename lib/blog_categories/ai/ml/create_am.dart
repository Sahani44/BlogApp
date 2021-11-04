
import 'package:blog_app/blog_categories/ai/ml/create_newam.dart.dart';
import 'package:flutter/material.dart';


class CreateAM extends StatefulWidget {
  const CreateAM({ Key? key }) : super(key: key);

  @override
  _CreateAMState createState() => _CreateAMState();
}

class _CreateAMState extends State<CreateAM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ai/Ml Blogs"),
      ),
      body: Container(),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNam()));
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
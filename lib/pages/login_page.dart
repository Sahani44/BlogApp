// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:blog_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButton = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    await Navigator.pushNamed(context , MyRoutes.homeRoute);
    setState(() {
      changeButton = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/loginImage.png",
                fit: BoxFit.cover,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20.0,
                //child: Text(""),
              ),
              Text("Welcome $name",
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20.0,
                //child: Text(""),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: "Enter User Name",
                      labelText: "User Name",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "User Name cannot be Empty";
                      }
                      return null;
                    },
                    onChanged: (value){
                      name = value;
                      setState(() {
                        
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password cannot be Empty";
                      }
                      else if (value.length<6) {
                        return "Password must be of atleast 6 characters";
                      }
                      return null;
                    },
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                  height: 40.0,
                  //child: Text(""),
                    ),
                
                  Material(
                
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(changeButton ?50:7),
                    child: InkWell(
                      onTap: () => moveToHome(),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: changeButton? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton?Icon(Icons.done,
                          color: Colors.white,
                        ) : 
                        Text("Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                
                 /*               ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context , MyRoutes.homeRoute);
                    } , 
                    style: TextButton.styleFrom(
                      minimumSize: Size(130 , 40),
                    ),
                    child: Text("Login",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    ),
                 */         
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
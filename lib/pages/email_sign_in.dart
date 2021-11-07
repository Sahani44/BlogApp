import 'package:blog_app/pages/home_page.dart';
import 'package:blog_app/pages/verify.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({ Key? key }) : super(key: key);

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {

  String _email = "";
  String _name = "";
  String _password = "";
  final auth = FirebaseAuth.instance;
  bool changeButtonli = false;
  bool changeButtonsu = false;
  final _formKey = GlobalKey<FormState>();

  moveToHomeli() async {
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButtonli = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    await auth.signInWithEmailAndPassword(email: _email, password: _password);

    //await Navigator.pushNamed(context , MyRoutes.homeRoute);
    //await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));

    setState(() {
      changeButtonli = false;
    });
    }
  }
  moveToHomesu() async {
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButtonsu = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    await auth.createUserWithEmailAndPassword(email: _email, password: _password).then((value) => {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VerifyScreen()))
    });
    final user =  FirebaseAuth.instance.currentUser!;
    user.updateDisplayName(_name);
    user.updatePhotoURL('https://i.pinimg.com/originals/cf/f8/81/cff88167e47af84658194f167ece0aea.png');
    //await Navigator.pushNamed(context , MyRoutes.homeRoute);
    
    //await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    setState(() {
      changeButtonsu = false;
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
              Text("Welcome $_name",
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
                        keyboardType: TextInputType.emailAddress,
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
                      setState(() {
                        _name = value.trim();
                      });
                    },
                  ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: "Enter Email id",
                      labelText: "User Email",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "User Email cannot be Empty";
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState(() {
                        _email = value.trim();
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
                    onChanged: (value){
                      setState(() {
                        _password = value.trim();
                      });
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
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(changeButtonli ?50:7),
                        child: InkWell(
                          onTap: () => moveToHomeli(),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: changeButtonli? 50 : 150,
                            height: 50,
                            //alignment: Alignment.center,
                            child: changeButtonli?Icon(Icons.done,
                              color: Colors.white,
                            ) : 
                            Center(
                              child: Text("Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Material(
                
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(changeButtonli ?50:7),
                        child: InkWell(
                          onTap: () => moveToHomesu(),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: changeButtonsu? 50 : 150,
                            height: 50,
                            //alignment: Alignment.center,
                            child: changeButtonsu?Icon(Icons.done,
                              color: Colors.white,
                            ) : 
                            Center(
                              child: Text("Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )

                
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
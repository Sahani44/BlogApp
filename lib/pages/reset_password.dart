import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({ Key? key }) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  String _email = "";
  final auth = FirebaseAuth.instance;
  bool changeButtonFp = false;
  final _formKey = GlobalKey<FormState>();

  resetPass() async {
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButtonFp = true;
    });
    await Future.delayed(Duration(milliseconds: 500));

    await auth.sendPasswordResetEmail(email: _email);
    Navigator.pop(context);
    
    /*setState(() {
      changeButtonli = false;
    });*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Reset Password"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
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
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(changeButtonFp ?50:7),
                          child: InkWell(
                            onTap: () => resetPass(),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: changeButtonFp? 50 : 150,
                              height: 50,
                              //alignment: Alignment.center,
                              child: changeButtonFp?const Icon(Icons.done,
                                color: Colors.white,
                              ) : 
                              Center(
                                child: Text("Proceed",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                    )
                  ],
                ),
              ),
            )
          )
        ),
      ),  
    );
  }
}


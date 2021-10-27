import 'package:flutter/material.dart';
import 'package:blog_app/utils/routes.dart';
import 'package:blog_app/widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  /*  bool b = true;
    num t = 30; //num can be assinged value of any numeric type , eg : int , double
    t = 30.5;
    var day1 = "tuesday"; //var can be assinged value of any type
    const pi = 3.14;
    const a = "Hello"; // const can be assingned any value which would remain constant(can not be changed)
   */ 
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,//or ThemeMode.dark for dark method.
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/login",
      routes: {
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.homeRoute : (context) => HomePage(),
      },
    );
  }
}
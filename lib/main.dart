import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration/login.dart';

import 'employeeDrawer.dart';

main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alien Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue),
      home: LoginFormPage(),
    );
  }

}
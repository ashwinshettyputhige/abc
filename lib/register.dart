import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'employeeDrawer.dart';
import 'dart:async';
import 'dart:convert';
import "package:dio/dio.dart";
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _jobController = TextEditingController();
  // Map<String,String> header={"Content-Type":"application/jason"};
  Future<void> login() async {
    try{
      final response = await Dio().post(
        'http://localhost:8080/register',
        data: {
          'name': _usernameController.text,
          'password': _passwordController.text,
          'age': _ageController.text,
          'job': _jobController.text,
        },
      );
      // var response = await Dio().get('http://localhost:8080/login');
      if(response.statusCode ==200){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx){

              return employeeDrawer();
            }
        )
        );
        print(response.statusCode);
      }else{
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx){

              return employeeDrawer();
            }
        )
        );
      }
    }
    catch(e)
    {
      print(e);
    }

    // String username = _usernameController.text;
    // String password = _passwordController.text;
    // var data={'name': '$username', 'password': '$password'};
    // var body=json.encode(data);
    // Make an HT TPrequest to the server
    // var response = await http.post(
    //   Uri.parse('http://localhost:8080/login'),headers:header ,
    //   body: body
    //
    // );
    // final url = Uri.parse('http://localhost:8080/login');
    // final response = await http.post(
    //   url,
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: jsonEncode({
    //     "name": "ashwin",
    //     "password": "shetty"
    //   }),
    // );
    //
    // print("response $response ");
    //
    // // Process the response
    // if (response.statusCode == 200) {
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (ctx){
    //
    //       return employeeDrawer();},
    //
    //   )
    //   );
    // } else {
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (ctx){
    //       return LoginFormPage();},
    //   )
    //   );
    // }

    // return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Form'),
      // ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color:Colors.blue,
                  width: double.infinity,
                  child: Text('Registration',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white,fontStyle: FontStyle.italic))),
            ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.white))),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(),),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'age',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.white))),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _jobController,
                decoration: InputDecoration(labelText: 'job',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.white))),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: login
                ,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

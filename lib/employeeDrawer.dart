import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration/login.dart';
import 'package:registration/register.dart';

import 'notes.dart';

class  employeeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return employeeDrawerState();
  }
}
class employeeDrawerState extends State<employeeDrawer>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALien Management'),

      ),
          body: Center(
        child: Container(child: Text('Welcome to Alien app')),

    ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.only(top:5.0 ,bottom:5.0 ),
          children: [
            DrawerHeader(child: Text("Alien Operations",style:TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 30)
              ,),
            decoration: BoxDecoration(
              color: Colors.blue,

            ),
            ),
            ListTile(
              title: Text('TodoList'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
    builder: (ctx){
    return TodoListScreen();},

            )
                );
                }
            ),
            ListTile(
              title: Text('Register Alien'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx){
                    return Register();},

                )
                );
              },

            )
          ],
          ),
        ),
      ),

    );
  }

}
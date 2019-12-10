import 'package:flutter/material.dart';
import 'package:json_auto_refresh/widgets/active_users.dart';

class UsersApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
    
       title: 'My Active Users Widget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.purple,
      ),
      home:  ActiveUsersList(),
      
       

    );
  } 
 }
import 'package:co_location/views/login.dart';
import 'package:co_location/views/register.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool signinpage = true;

  @override
  Widget build(BuildContext context){
    if(signinpage){
      return Login(param: toggleView);
    }else{
      return Register(param: toggleView);
    }
  }

  void toggleView(){
    setState(() {
      signinpage = !signinpage;
    });
}
}
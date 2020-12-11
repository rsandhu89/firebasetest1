import 'package:firebasetest/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//return either home or authenticate
   final user = Provider.of<User>(context);

    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
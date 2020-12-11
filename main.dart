import 'package:firebasetest/Screens/wrapper.dart';
import 'package:firebasetest/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main(){
  runApp(outbakventuresapp());
}

// ignore: camel_case_types
class outbakventuresapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Welcome to Outbak Ventures',
          theme: ThemeData(primarySwatch: Colors.teal),
          home: Wrapper(),
        ));
  }
}
import 'package:firebasetest/services/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function toggleView;

  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = "";

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Here'),
        elevation: 0,
        backgroundColor: Colors.teal,
        actions: <Widget>[
          FlatButton.icon(
            label: Text("Sign up"),
            icon: Icon(Icons.person),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        width: 0.60 * MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: const EdgeInsets.all(36.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('outbaklogo.png', height: 200),
              TextFormField(
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Company Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 25.0),
              TextFormField(
                  obscureText: true,
                  //   style: style,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter Password';
                    } else {
                      if (val.length < 6) {
                        return 'Password must be more than 6 characters';
                      } else {
                        return null;
                      }
                    }
                  },
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(
                height: 25.0,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.teal),
                ),
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = "Please recheck Email and Password";
                        loading = false;
                      });
                    } 
                  }
                },
                child: Text("Login",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: 20,),
              Text(error,
                style: TextStyle(color : Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

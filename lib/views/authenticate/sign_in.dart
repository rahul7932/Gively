import 'package:flutter/material.dart';
import 'package:Gively/services/auth.dart';
import 'package:Gively/utils/constants.dart';
import 'package:Gively/views/widgets/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white, //grey[200]
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(163, 198, 100, 1),
              elevation: 0.0,
              title: Text('Sign in to Gively'),
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label:
                        Text('Register', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      widget.toggleView();
                    })
              ],
            ),
            body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          new Image.asset("assets/logo.png",
                              width: 400, height: 225),
                          // new Container(
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       image: AssetImage('assets/logo.png'),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 20.0),
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'Email'),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an Email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              }),
                          SizedBox(height: 20.0),
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'Password'),
                              obscureText: true,
                              validator: (val) => val.length < 6
                                  ? 'Enter an a password 6+ chars long'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              }),
                          SizedBox(height: 20.0),
                          RaisedButton(
                              color: Color.fromRGBO(163, 198, 100, 1),
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error =
                                          'These credentials were not recognized. Please try again.';
                                      loading = false;
                                    });
                                  }
                                }
                              }),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                          SizedBox(height: 5.0),
                          // Text("OR",
                          //     style: TextStyle(
                          //         color: Colors.grey, fontSize: 12.0)),

                          // FlatButton(
                          //   onPressed: () {},
                          //   padding: EdgeInsets.all(20.0),
                          //   child: Image.asset('assets/SignInWithGoogle.png',
                          //       width: 200.0, height: 70.0),
                          // ),
                        ],
                      ),
                    ))));
  }
}

import 'package:Gively/blocs/authorization_bloc/authorization_bloc.dart';
import 'package:Gively/views/authenticate/register.dart';
import 'package:Gively/views/home/home.dart';
import 'package:Gively/views/widgets/shared/flushbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:Gively/utils/constants.dart';
import 'package:Gively/views/widgets/shared/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _userNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
      if (state is AuthorizationSuccessState) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else if (state is AuthorizationFailState) {
        flushBarError(context, state.message);
      }
    }, builder: (context, state) {
      if (state is AuthorizationPendingState) {
        return Loading();
      } else {
        return Scaffold(
          resizeToAvoidBottomPadding: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Image.asset("assets/logo.png", width: 400, height: 225),
                    SizedBox(height: 20.0),
                    TextFormField(
                        controller: _userNameTextController,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an Email' : null,
                       ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _passwordTextController,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => val.length < 6
                          ? 'Enter an a password 6+ chars long'
                          : null,
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: kPrimaryColor,
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            BlocProvider.of<AuthorizationBloc>(context).add(
                                SignInEvent(
                                    email: _userNameTextController.text,
                                    password: _passwordTextController.text));
                          }
                        }),
                    SizedBox(height: 10.0),
                    FlatButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline),
                        ),
                        onPressed: () async {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        }),
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
              ),
            ),
          ),
        );
      }
    });
  }
}

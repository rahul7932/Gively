import 'package:Gively/blocs/authorization_bloc/authorization_bloc.dart';
import 'package:Gively/views/authenticate/sign_in.dart';
import 'package:Gively/views/widgets/shared/flushbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:Gively/utils/constants.dart';
import 'package:Gively/views/widgets/shared/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _passwordTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        if (state is VerificationEmailSentState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignIn()));
          flushBarSuccess(
              context, 'A verification email has been sent to your address.');
        }
      },
      builder: (context, state) {
        if (state is AuthorizationPendingState) {
          return Loading();
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white, //grey[200],
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      new Image.asset("assets/logo.png", width: 400, height: 225),
                      SizedBox(height: 20.0),
                      TextFormField(
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
                          validator: (val) => val.length < 6
                              ? 'Enter an a password 6+ chars long'
                              : null,
                          obscureText: true,),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: kPrimaryColor, //green[400]
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              BlocProvider.of<AuthorizationBloc>(context).add(
                                  SignUpEvent(email: _usernameTextController.text, password: _passwordTextController.text));
                            }
                          }),
                      SizedBox(height: 30.0),
                      Text('Already have an account?'),
                      FlatButton(
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: kPrimaryColor, decoration: TextDecoration.underline),
                          ),
                          onPressed: () async {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => SignIn()));
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:Gively/blocs/authorization_bloc/authorization_bloc.dart';
import 'package:Gively/views/authenticate/sign_in.dart';
import 'package:Gively/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state){
        if (state is AuthorizationSuccessState) {
          return Home();
        } else {
          return SignIn();
        }
      },
    );

    }

  }

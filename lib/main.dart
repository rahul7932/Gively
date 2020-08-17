import 'package:Gively/blocs/authorization_bloc/authorization_bloc.dart';
import 'package:Gively/blocs/bloc_delegate.dart';
import 'package:Gively/data/repositories/authorization_repository.dart';
import 'package:Gively/views/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthorizationBloc>(
          create: (context) => AuthorizationBloc(AuthRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

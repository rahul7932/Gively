import 'package:Gively/blocs/authorization_bloc/authorization_bloc.dart';
import 'package:Gively/blocs/bloc_delegate.dart';
import 'package:Gively/data/repositories/authorization_repository.dart';
import 'package:Gively/views/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthorizationBloc>(
          create: (context) => AuthorizationBloc(AuthRepository())..add(CheckStoredAuthDataEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

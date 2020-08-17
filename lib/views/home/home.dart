import 'package:Gively/blocs/authorization_bloc/authorization_bloc.dart';
import 'package:Gively/views/home/drive_list.dart';
import 'package:Gively/views/home/information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
        builder: (context, state) {
          return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Gively'),
            backgroundColor: Color.fromRGBO(163, 198, 100, 1),
            leading: Row(children: [
              IconButton(
                  icon: Icon(Icons.info, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InformationPage()));
                  }),
              // SizedBox(width: 500),
              // IconButton(
              //   icon: Icon(Icons.search),
              //   color: Colors.white,
              // ),
            ]),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text('logout', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  BlocProvider.of<AuthorizationBloc>(context).add(SignOutEvent());
                },
              ),
            ]),
        body: DriveList(),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:Gively/services/auth.dart';
import 'package:Gively/services/database.dart';
import 'package:provider/provider.dart';
import 'package:Gively/screens/home/drive_list.dart';
import 'package:Gively/models/drive.dart';
import 'package:Gively/screens/home/information.dart';
import 'package:Gively/screens/home/donatationpage.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Drive>>.value(
        value: DatabaseService().drives,
        child: Scaffold(
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
                    await _auth.signOut();
                  },
                ),
              ]),
          body: DriveList(),
        ));
  }
}

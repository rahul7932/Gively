import 'package:Gively/data/models/models.dart';
import 'package:Gively/views/authenticate/authenticate.dart';
import 'package:Gively/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

// return either home or auth widget

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

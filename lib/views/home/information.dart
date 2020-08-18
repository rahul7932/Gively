import 'package:Gively/utils/constants.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            title: Text('More Information'),
            backgroundColor: kPrimaryColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                child: Center(
                    child: Column(children: <Widget>[
                  Text(
                      'Welcome to Gively! This app provides the Loudoun County Community with access to all of the community donation drives that are occuring in the county. We make donating to schools, churches, temples, homeless shelters, and other initiatives as convenient as it can possibly be! We plan to expand our app throughout NOVA, VA, and eventually the US in the future! Our app is currently patent pending.',
                      style: TextStyle(
                          fontSize: 19.0,
                          color: kPrimaryColor),
                      textAlign: TextAlign.center),
                  SizedBox(height: 10),
                  Text(
                    '- Rahul Kumar and Rohan Bhansali',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0,
                        color: kPrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 370.0),
                  Text('v1.1.0',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: kPrimaryColor,
                          fontStyle: FontStyle.italic))
                ])))));
  }
}

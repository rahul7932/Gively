import 'package:Gively/utils/constants.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
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
                      'Welcome to Gively! Our app provides communities around the US with access to local community donation drive. We make donating to schools, churches, temples, homeless shelters, and other initiatives as convenient as possible! Our app is currently patent pending. For any questions, please contact givelyteam@gmail.com.',
                      style: TextStyle(fontSize: 21.0, color: kPrimaryColor),
                      textAlign: TextAlign.center),
                  // SizedBox(height: 20),
                  // Text(
                  //   'For any questions, please contact givelyteam@gmail.com',
                  //   style: TextStyle(fontSize: 21.0, color: kPrimaryColor),
                  //   textAlign: TextAlign.center,
                  // ),
                  SizedBox(height: 20),
                  Text(
                    '- Rahul Kumar and Rohan Bhansali',
                    style: TextStyle(fontSize: 21.0, color: kPrimaryColor),
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

import 'package:Gively/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DriveTile extends StatelessWidget {
  final Drive drive;
  DriveTile({this.drive});

  backgroundImageMethod() {
    if ('${drive.school}' == 'Independence High School') {
      return Image.asset('assets/indylogo.png');
    } else if ('${drive.school}' == 'Briar Woods High School') {
      return Image.asset(
        'assets/bwhslogo.jpg',
      );
    } else if ('${drive.school}' == 'Loudoun County High School') {
      return Image.asset(
        'assets/lchslogo.png',
      );
    } else if ('${drive.school}' == 'John Champe High School') {
      return Image.asset(
        'assets/jchslogo.png',
      );
    } else if ('${drive.school}' == 'Freedom High School') {
      return Image.asset(
        'assets/fhslogo.jpg',
      );
    } else if ('${drive.school}' == 'Dominion High School') {
      return Image.asset(
        'assets/dhslogo.png',
      );
    } else if ('${drive.school}' == 'Park View High School') {
      return Image.asset(
        'assets/pvhslogo.png',
      );
    } else {
      return Image.asset('assets/rrhslogo.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    double donationRatio =
        (int.parse(drive.currentDonations) / int.parse(drive.maxDonations));
    String url = drive.form;
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            color: Colors.grey[200],
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Colors.grey[200],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: backgroundImageMethod(),
                  ),
                ),
                title: Text(drive.club,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${drive.description}'),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                            child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 50.0),
                          color: Color.fromRGBO(163, 198, 100, 1),
                          child: Column(children: [
                            // FlatButton.icon(
                            //     icon: Icon(Icons.check, color: Colors.green),
                            //     label: Text('Sign Up To Donate',
                            //         style: TextStyle(fontSize: 15.0)),
                            //     onPressed: () {}),

                            SizedBox(height: 25),
                            Text('Address:' + ' ${drive.address}',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            SizedBox(height: 15),
                            Text('School:' + ' ${drive.school}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                )),
                            SizedBox(height: 15),
                            Text('Contact:' + ' ${drive.contact}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                )),
                            SizedBox(height: 15),
                            Text('Dates Active:' + ' ${drive.date}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                )),
                            SizedBox(height: 15),
                            Text('Description:' + ' ${drive.detailDescription}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                )),
                            SizedBox(height: 20),
                            LinearProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                              backgroundColor: Colors.grey,
                              value: donationRatio,
                            ),
                            SizedBox(height: 15),
                            Text(
                                '${drive.currentDonations}' +
                                    '/' +
                                    '${drive.maxDonations}' +
                                    ' donated.',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                )),
                            SizedBox(height: 20),
                            RaisedButton(
                                color: Colors.grey[200],
                                child: Text('Sign Up to Donate',
                                    style: TextStyle(
                                      color: Color.fromRGBO(163, 198, 100, 1),
                                      fontSize: 16.0,
                                    )),
                                onPressed: () async {
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }),
                            SizedBox(height: 25),
                          ]),
                        ));
                      });
                })));
  }
}

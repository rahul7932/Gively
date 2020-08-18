import 'package:Gively/data/models/models.dart';
import 'package:Gively/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DriveTile extends StatelessWidget {
  final Drive drive;
  DriveTile({this.drive});

  backgroundImageMethod() {
    if ('${drive.locationName}' == 'Independence High School') {
      return Image.asset('assets/indylogo.png');
    } else if ('${drive.locationName}' == 'Briar Woods High School') {
      return Image.asset(
        'assets/bwhslogo.jpg',
      );
    } else if ('${drive.locationName}' == 'Loudoun County High School') {
      return Image.asset(
        'assets/lchslogo.png',
      );
    } else if ('${drive.locationName}' == 'John Champe High School') {
      return Image.asset(
        'assets/jchslogo.png',
      );
    } else if ('${drive.locationName}' == 'Freedom High School') {
      return Image.asset(
        'assets/fhslogo.jpg',
      );
    } else if ('${drive.locationName}' == 'Dominion High School') {
      return Image.asset(
        'assets/dhslogo.png',
      );
    } else if ('${drive.locationName}' == 'Park View High School') {
      return Image.asset(
        'assets/pvhslogo.png',
      );
    } else {
      return Image.asset('assets/rrhslogo.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    double donationRatio = drive.currentDonations / drive.maxDonations;
    String url = drive.formLink;
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            color: Colors.grey[200],
            child: ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: backgroundImageMethod(),
                  ),
                ),
                title: Text(drive.clubName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${drive.descriptionShort}'),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                            child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 50.0),
                          color: kPrimaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 25),
                                    Text('Address:' + ' ${drive.address}',
                                        style: TextStyle(
                                            fontSize: 20.0, color: Colors.white)),
                                    SizedBox(height: 15),
                                    Text('School:' + ' ${drive.locationName}',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        )),
                                    SizedBox(height: 15),
                                    Text('Contact:' + ' ${drive.contactEmail}',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        )),
                                    SizedBox(height: 15),
                                    Text('Dates Active:' + ' ${drive.startDate}',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        )),
                                    SizedBox(height: 15),
                                    Text(
                                        'Description:' +
                                            ' ${drive.descriptionLong}',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        )),
                                  ]),
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
                                        color: kPrimaryColor,
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
                            ],
                          ),
                        ));
                      });
                })));
  }
}

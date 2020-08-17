// import 'package:flutter/material.dart';
// import 'package:Gively/shared/constants.dart';
// import 'package:Gively/screens/home/home.dart';
// import 'package:Gively/screens/home/donationidpage.dart';

// class DonationPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Donation Page'),
//         backgroundColor: Color.fromRGBO(163, 198, 100, 1),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Home()));
//           },
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
//         child: SingleChildScrollView(
//             child: Column(
//           children: <Widget>[
//             SizedBox(height: 15),
//             Text('How many items would you like to donate?',
//                 style: TextStyle(
//                     color: Color.fromRGBO(163, 198, 100, 1), fontSize: 17)),
//             SizedBox(height: 10),
//             TextFormField(
//               decoration:
//                   textInputDecoration.copyWith(hintText: 'Number of Items'),
//             ),
//             SizedBox(height: 15),
//             Text('When you will you be dropping off your donation?',
//                 style: TextStyle(
//                     color: Color.fromRGBO(163, 198, 100, 1), fontSize: 17)),
//             SizedBox(height: 10),
//             TextFormField(
//               decoration: textInputDecoration.copyWith(hintText: 'mm/dd/yy'),
//             ),
//             SizedBox(height: 15),
//             Text(
//                 'Are you affiliated with the program to which you are donating?',
//                 style: TextStyle(
//                     color: Color.fromRGBO(163, 198, 100, 1), fontSize: 17)),
//             SizedBox(height: 10),
//             TextFormField(
//               decoration: textInputDecoration.copyWith(hintText: 'Yes or No'),
//             ),
//             SizedBox(height: 15),
//             RaisedButton(
//               color: Color.fromRGBO(163, 198, 100, 1),
//               child: Text(
//                 'Confirm Donation',
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => DonationIDPage()));
//               },
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }

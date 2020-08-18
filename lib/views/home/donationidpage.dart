// import 'package:flutter/material.dart';
// import 'package:Gively/screens/home/donatationpage.dart';
// import 'package:Gively/screens/home/home.dart';

// class DonationIDPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           backgroundColor: kPrimaryColor,
//           title: Text('Donation Confirmed'),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => DonationPage()));
//             },
//           ),
//         ),
//         body: Container(
//             padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
//             child: Center(
//                 child: Column(children: [
//               SizedBox(height: 15),
//               Text('Your donation has been confirmed!',
//                   style: TextStyle(
//                       fontSize: 25.0,
//                       color: kPrimaryColor,
//                       fontWeight: FontWeight.bold)),
//               SizedBox(height: 15),
//               Text(
//                   'Please write your email on a small piece of paper or index card and attach it to your donation. This will be used to give you credit for your donation. All information will be kept private.',
//                   style: TextStyle(
//                       fontSize: 20.0, color: kPrimaryColor)),
//             ]))));
//   }
// }

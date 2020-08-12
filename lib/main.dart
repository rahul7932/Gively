// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Gively/screens/wrapper.dart';
import 'package:Gively/services/auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:Gively/models/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:givelyapp/models/drive.dart';
// import 'package:givelyapp/screens/home/drive_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

// class SignInDemo extends StatefulWidget {
//   @override
//   _SignInDemoState createState() => _SignInDemoState();
// }

// class _SignInDemoState extends State<SignInDemo> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   bool isLoading = false;
//   bool isLoggedIn = false;

//   SharedPreferences prefs;
//   FirebaseUser currentUser;

//   @override
//   void initState() {
//     super.initState();
//     isSignIn();
//   }

//   void isSignIn() async {
//     setState(() {
//       isLoading = true;
//     });
//     prefs = await SharedPreferences.getInstance();

//     isLoggedIn = await _googleSignIn.isSignedIn();
//     if (isLoading) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => DriveList));
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }

//   Future<Null> handleSignIn() async {
//     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     AuthCredential credential = GoogleAuthProvider.getCredential(
//         idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
//     final FirebaseUser firebaseUser =
//         (await firebaseAuth.signInWithCredential(credential)).user;

//     if (firebaseUser != null) {
//       final QuerySnapshot result = await Firestore.instance
//           .collection('user')
//           .where('id', isEqualTo: firebaseUser.uid)
//           .getDocuments();

//       List<DocumentSnapshot> documents = result.documents;
//       if (documents.length == 0) {
//         Firestore.instance
//             .collection('user')
//             .document(firebaseUser.uid)
//             .setData({
//           'id': firebaseUser.uid,
//           'username': firebaseUser.displayName,
//           'photoUrl': firebaseUser.photoUrl
//         });

//         currentUser = firebaseUser;
//         await prefs.setString('id', currentUser.uid);
//         await prefs.setString('username', currentUser.displayName);
//         await prefs.setString('PhotoUrl', currentUser.photoUrl);
//       } else {
//         await prefs.setString('id', documents[0]['id']);
//         await prefs.setString('username', documents[0]['username']);
//         await prefs.setString('PhotoUrl', documents[0]['photoUrl']);
//       }
//       Fluttertoast.showToast(msg: 'Sign In Successful');
//       setState(() {
//         isLoading = false;
//       });
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => DriveList));
//     } else {
//       Fluttertoast.showToast(msg: 'Sign In Fail');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

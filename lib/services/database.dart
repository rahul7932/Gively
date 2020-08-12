import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Gively/models/drive.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference users = Firestore.instance.collection('users');
  final CollectionReference donationDrives =
      Firestore.instance.collection('donationDrives');

  Future updateUserData(String numberOfDonations, String name) async {
    return await users.document(uid).setData({
      'numberOfDonations': numberOfDonations,
      'name': name,
    });
  }

  // drive list from snapshot
  List<Drive> _driveListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Drive(
        address: doc.data['address'] ?? '',
        school: doc.data['school'] ?? '',
        club: doc.data['club'] ?? '',
        contact: doc.data['contact'] ?? '',
        description: doc.data['description'] ?? '',
        detailDescription: doc.data['detailDescription'] ?? '',
        date: doc.data['date'] ?? '',
        maxDonations: doc.data['maxDonations'] ?? '',
        currentDonations: doc.data['currentDonations'] ?? '',
        form: doc.data['form'] ?? '',
      );
    }).toList();
  }

  Stream<List<Drive>> get drives {
    return donationDrives.snapshots().map(_driveListFromSnapshot);
  }
}

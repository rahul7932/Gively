import 'package:Gively/data/interfaces/idrives_respository.dart';
import 'package:Gively/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrivesRepository extends IDrivesRepository {
  final _firestore = FirebaseFirestore.instance;
  static const DRIVES = 'donationDrives';

  @override
  Future<List<Drive>> fetchDrives() async {
    List<Drive> drivesList = List<Drive>();
    QuerySnapshot categoriesSnapshot =
        await _firestore.collection(DRIVES).get();
    categoriesSnapshot.docs.forEach((drive) {
      drivesList.add(Drive.fromJson(drive.data()));
    });
    return drivesList;
  }
}

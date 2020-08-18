import 'package:Gively/data/models/models.dart';

abstract class IDrivesRepository {
  Future<List<Drive>> fetchDrives();
}

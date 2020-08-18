import 'package:Gively/data/interfaces/idrives_respository.dart';
import 'package:Gively/data/models/models.dart';

class DrivesService {
  final IDrivesRepository repository;
  DrivesService(this.repository);

  Future<List<Drive>> fetchDrives() async {
    var drives = await repository.fetchDrives();
    return drives;
  }
}
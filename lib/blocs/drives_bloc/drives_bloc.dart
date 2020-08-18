import 'dart:async';

import 'package:Gively/data/interfaces/idrives_respository.dart';
import 'package:Gively/data/models/models.dart';
import 'package:Gively/data/services/drives_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drives_event.dart';
part 'drives_state.dart';

class DrivesBloc extends Bloc<DrivesEvent, DrivesState> {
  DrivesService _drivesService;

  DrivesBloc(IDrivesRepository _drivesRepository) : super(DrivesLoading()){
    _drivesService = DrivesService(_drivesRepository);
  }

  @override
  Stream<DrivesState> mapEventToState(
    DrivesEvent event,
  ) async* {
    switch (event.runtimeType){
      case DrivesLoadEvent:
        yield* _mapLoadEventToState(event);
        break;
      default:
        yield DrivesLoading();
        break;
    }
  }

  Stream<DrivesState> _mapLoadEventToState(DrivesLoadEvent event)async*{
    print('made it here');
    List<Drive> drivesList = await _drivesService.fetchDrives();
    yield DrivesLoadSuccess(drivesList: drivesList);
  }

}

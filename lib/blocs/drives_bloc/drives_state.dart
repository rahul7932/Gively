part of 'drives_bloc.dart';

abstract class DrivesState extends Equatable {
  const DrivesState();
}

class DrivesLoading extends DrivesState {
  @override
  List<Object> get props => [];
}

class DrivesLoadSuccess extends DrivesState {
  DrivesLoadSuccess({this.drivesList});
  final List<Drive> drivesList;
  @override
  List<Object> get props => [drivesList];
}

class DrivesLoadFail extends DrivesState {
  @override
  List<Object> get props => [];
}



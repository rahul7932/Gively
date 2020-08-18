part of 'drives_bloc.dart';

abstract class DrivesEvent extends Equatable {
  const DrivesEvent();
}

class DrivesLoadEvent extends DrivesEvent{
  @override
  List<Object> get props => [];
}

class DrivesListFilterEvent extends DrivesEvent{
  DrivesListFilterEvent({this.searchValue});
  final String searchValue;
  @override
  List<Object> get props => [searchValue];
}
import 'package:Gively/blocs/drives_bloc/drives_bloc.dart';
import 'package:Gively/views/home/drive_tile.dart';
import 'package:Gively/views/widgets/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriveList extends StatefulWidget {
  @override
  _DriveListState createState() => _DriveListState();
}

class _DriveListState extends State<DriveList> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrivesBloc, DrivesState>(listener:(context, state){
    },builder: (context, state) {
      if (state is DrivesLoadSuccess) {
        return ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: state.drivesList.length,
            itemBuilder: (context, index) {
              return DriveTile(drive: state.drivesList[index]);
            });
      } else {
        return Loading();
      }
    });
  }
}

// child: new Theme(
//     data:
//         new ThemeData(primaryColor: kPrimaryColor),
//     // child: TextField(
//     //     decoration: InputDecoration(
//     //         // labelText: 'Search By Institution',
//     //         border: new OutlineInputBorder(
//     //             borderSide: new BorderSide(
//     //           color: kPrimaryColor,
//     //         )),
//     //         hintText: 'Search By School',
//     //         prefixIcon: const Icon(
//     //           Icons.school,
//     //           color: kPrimaryColor,
//     //         )))
//     )

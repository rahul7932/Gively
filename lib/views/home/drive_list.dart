import 'package:Gively/data/models/models.dart';
import 'package:Gively/views/home/drive_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriveList extends StatefulWidget {
  @override
  _DriveListState createState() => _DriveListState();
}

class _DriveListState extends State<DriveList> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final drives = Provider.of<List<Drive>>(context);

    return ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: 1 + drives.length - 1,
        itemBuilder: (context, index) {
          return DriveTile(drive: drives[index]);
        });
  }
}

// child: new Theme(
//     data:
//         new ThemeData(primaryColor: Color.fromRGBO(163, 198, 100, 1)),
//     // child: TextField(
//     //     decoration: InputDecoration(
//     //         // labelText: 'Search By Institution',
//     //         border: new OutlineInputBorder(
//     //             borderSide: new BorderSide(
//     //           color: Color.fromRGBO(163, 198, 100, 1),
//     //         )),
//     //         hintText: 'Search By School',
//     //         prefixIcon: const Icon(
//     //           Icons.school,
//     //           color: Color.fromRGBO(163, 198, 100, 1),
//     //         )))
//     )

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
    //final drives = Provider.of<List<Drive>>(context);

    Drive drive = Drive(
        school: 'Loudoun County High School',
        address: 'TestAddress',
        description: 'desc',
        date: '10/2/2020',
        detailDescription: 'detail',
        currentDonations: '50',
        maxDonations: '100',
    club: 'club');
    List<Drive> drives = [drive];
    return ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: drives.length,
        itemBuilder: (context, index) {
          return DriveTile(drive: drives[index]);
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

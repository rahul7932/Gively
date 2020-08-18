import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Drive extends Equatable {
  final String address;
  final String locationName;
  final String clubName;
  final String contactEmail;
  final String descriptionShort;
  final String descriptionLong;
  final Timestamp startDate;
  final Timestamp endDate;
  final num maxDonations;
  final num currentDonations;
  final String formLink;

  Drive(
      {this.address,
      this.locationName,
      this.clubName,
      this.contactEmail,
      this.descriptionShort,
      this.descriptionLong,
      this.startDate,
      this.endDate,
      this.currentDonations,
      this.maxDonations,
      this.formLink});

  Drive.fromJson(Map<String, dynamic> json)
      : address = json['address'] ?? '',
        locationName = json['locationName'] ?? '',
        clubName = json['clubName'] ?? '',
        contactEmail = json['contactEmail'] ?? '',
        descriptionShort = json['descriptionShort']?? '',
        descriptionLong = json['descriptionLong']?? '',
        startDate = json['startDate']?? Timestamp.now(),
        endDate = json['endDate'] ?? Timestamp.now(),
        maxDonations = json['maxDonations'] ?? 0,
        currentDonations = json['currentDonations']?? 0,
        formLink = json['formLink'] ?? '';

  Map<String, dynamic> toJson() => {
        'address': address,
        'locationName': locationName,
        'clubName': clubName,
        'contactEmail': contactEmail,
        'descriptionShort': descriptionShort,
        'descriptionLong': descriptionLong,
        'startDate': startDate,
        'endDate': endDate,
        'maxDonations': maxDonations,
        'currentDonations': currentDonations,
        'formLink': formLink,
      };

  @override
  List<Object> get props => [
        address,
        locationName,
        clubName,
        contactEmail,
        descriptionShort,
        descriptionLong,
        startDate,
        endDate,
        currentDonations,
        maxDonations,
        formLink
      ];

}

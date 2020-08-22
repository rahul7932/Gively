import 'package:equatable/equatable.dart';

class Drive extends Equatable {
  final String address;
  final String locationName;
  final String clubName;
  final String contactEmail;
  final String descriptionShort;
  final String descriptionLong;
  final DateTime startDate;
  final DateTime endDate;
  final num maxDonations;
  final num currentDonations;
  final String formLink;
  final String imageLink;

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
      this.formLink,
      this.imageLink});

  Drive.fromJson(Map<String, dynamic> json)
      : address = json['address'] ?? '',
        locationName = json['locationName'] ?? '',
        clubName = json['clubName'] ?? '',
        contactEmail = json['contactEmail'] ?? '',
        descriptionShort = json['descriptionShort'] ?? '',
        descriptionLong = json['descriptionLong'] ?? '',
        startDate = json['startDate']?.toDate() ?? DateTime.now(),
        endDate = json['endDate']?.toDate() ?? DateTime.now(),
        maxDonations = json['maxDonations'] ?? 0,
        currentDonations = json['currentDonations'] ?? 0,
        formLink = json['formLink'] ?? '',
        imageLink = json['imageLink'] ?? '';

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
        'imageLink': imageLink
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
        formLink,
        imageLink
      ];
}

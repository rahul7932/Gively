class Drive {
  final String address;
  final String locationName;
  final String club;
  final String contactEmail;
  final String descriptionShort;
  final String descriptionLong;
  final DateTime startDate;
  final DateTime endDate;
  final num maxDonations;
  final num currentDonations;
  final String formLink;

  Drive(
      {this.address,
      this.locationName,
      this.club,
      this.contactEmail,
      this.descriptionShort,
      this.descriptionLong,
      this.startDate,
      this.endDate,
      this.currentDonations,
      this.maxDonations,
      this.formLink});

  Drive.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        locationName = json['locationName'],
        club = json['clubName'],
        contactEmail= json['contactEmail'],
        descriptionShort = json['descriptionShort'],
        descriptionLong = json['descriptionLong'],
        startDate = json['startDate'],
        endDate = json['endDate'],
        maxDonations = json['maxDonations'],
        currentDonations = json['currentDonations'],
        formLink = json['formLink'];

  Map<String, dynamic> toJson() =>
      {
        'address': address,
        'locationName': locationName,
        'club': club,
        'contactEmail': contactEmail,
        'descriptionShort': descriptionShort,
        'descriptionLong': descriptionLong,
        'startDate': startDate,
        'endDate': endDate,
        'maxDonations': maxDonations,
        'currentDonations': currentDonations,
        'formLink': formLink,
      };
}



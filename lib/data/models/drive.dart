class Drive {
  final String address;
  final String school;
  final String club;
  final String contact;
  final String description;
  final String detailDescription;
  final String date;
  final String maxDonations;
  final String currentDonations;
  final String form;

  Drive(
      {this.address,
      this.school,
      this.club,
      this.contact,
      this.description,
      this.detailDescription,
      this.date,
      this.currentDonations,
      this.maxDonations,
      this.form});

  Drive.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        school = json['school'],
        club = json['club'],
        contact = json['contact'],
        description = json['description'],
        detailDescription = json['detailDescription'],
        date = json['date'],
        maxDonations = json['maxDonations'],
        currentDonations = json['currentDonations'],
        form = json['form'];

  Map<String, dynamic> toJson() =>
      {
        'address': address,
        'school': school,
        'club': club,
        'contact': contact,
        'description': description,
        'detailDescription': detailDescription,
        'date': date,
        'maxDonations': maxDonations,
        'currentDonations': currentDonations,
        'form': form,
      };
}



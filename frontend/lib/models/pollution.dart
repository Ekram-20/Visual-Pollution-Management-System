class Pollution {
  
  late int id;
  final String date;
  final String street;
  final String location;
  final String locationUrl;
  final String type;
  final String image;
  final bool approved;
  final bool rejected;

  Pollution({
    required this.id,
    required this.date,
    required this.street,
    required this.location,
    required this.locationUrl,
    required this.type,
    required this.image,
    required this.approved,
    required this.rejected,
  });

  factory Pollution.fromJson(Map<String, dynamic> json) {
    return Pollution(
      id: json['id'],
      date: json['date'],
      street: json['street'],
      location: json['location'],
      locationUrl: json['location_url'],
      type: json['type'],
      image: json['image'],
      approved: json['approved'],
      rejected: json['rejected'],
    );
  }

  // Map<String, dynamic> toJson() => {
  //   'eid' : eid,
  //   'ename': ename,
  //   'eemail': eemail,
  // };
}

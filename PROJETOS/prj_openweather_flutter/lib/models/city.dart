class City {
  final String name;
  final String country;
  final double lat;
  final double lon;

  City(
      {required this.name,
      required this.country,
      required this.lat,
      required this.lon});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}

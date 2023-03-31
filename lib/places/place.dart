class Place {
  final double lat;
  final double lng;
  final String name;
  final String address;

  Place({
    required this.name,
    required this.lat,
    required this.lng,
    required this.address,
  });

  String uuid() {
    return "$lng-$lat";
  }
}

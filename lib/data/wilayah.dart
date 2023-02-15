class Wilayah {
  final String id;
  final String propinsi;
  final String kota;
  final String kecamatan;
  final String lat;
  final String lon;

  Wilayah({
    required this.id,
    required this.propinsi,
    required this.kota,
    required this.kecamatan,
    required this.lat,
    required this.lon,
  });

  Wilayah.fromJson(Map json)
      : id = json['id'],
        propinsi = json['propinsi'],
        kota = json['kota'],
        kecamatan = json['kecamatan'],
        lat = json['lat'],
        lon = json['lon'];

  Map toJson() {
    return {
      'id': id,
      'propinsi': propinsi,
      'kota': kota,
      'kecamatan': kecamatan,
      'lat': lat,
      'lon': lon,
    };
  }
}

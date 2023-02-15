class Cuaca {
  final String jamCuaca;
  final String kodeCuaca;
  final String cuaca;
  final String humidity;
  final String tempC;
  final String tempF;

  Cuaca({
    required this.jamCuaca,
    required this.kodeCuaca,
    required this.cuaca,
    required this.humidity,
    required this.tempC,
    required this.tempF,
  });

  Cuaca.fromJson(Map json)
      : jamCuaca = json['jamCuaca'],
        kodeCuaca = json['kodeCuaca'],
        cuaca = json['cuaca'],
        humidity = json['humidity'],
        tempC = json['tempC'],
        tempF = json['tempF'];
}

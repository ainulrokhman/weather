import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/data/cuaca.dart';
import 'package:weather/data/wilayah.dart';

const baseUrl = "https://ibnux.github.io/BMKG-importer";

class API {
  static Future<List<Wilayah>> getWilayah() async {
    var url = Uri.parse("$baseUrl/cuaca/wilayah.json");
    final response = await http.get(url);
    Iterable list = json.decode(response.body);
    if (response.statusCode != 200) {
      return throw Exception();
    }
    return list.map((e) => Wilayah.fromJson(e)).toList();
  }

  static Future<List<Cuaca>> getCuaca(String? id) async {
    var url = Uri.parse("$baseUrl/cuaca/$id.json");
    final response = await http.get(url);
    Iterable list = json.decode(response.body);
    if (response.statusCode != 200) {
      return throw Exception();
    }
    return list.map((e) => Cuaca.fromJson(e)).toList();
  }
}

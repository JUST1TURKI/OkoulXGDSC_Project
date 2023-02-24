// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'data.dart';

class JsonConnection {
  static late double pLat;
  static late double pLong;
  late Data list;
  Future getPTLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    pLat = position.latitude;
    pLong = position.longitude;

    String date = DateTime.now().toIso8601String();
    int method = 2;
    final url =
        'http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method';

    http.Response response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);

    list = Data.fromJson(data);

    return list;
  }
}

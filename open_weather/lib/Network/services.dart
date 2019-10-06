import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_weather/Model/weather.dart';

final String _appid = "9ed025abf86cabbd3eedfc531cd33a2f";

Future<OpenWeather> weatherDetails() async {
  final response =
      await http.get('http://api.openweathermap.org/data/2.5/weather?appid=$_appid&q=Dubai,ae&units=metric');
  if (response.statusCode == 200) {
    return OpenWeather.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

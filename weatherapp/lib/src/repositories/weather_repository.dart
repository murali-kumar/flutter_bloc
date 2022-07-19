import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/src/data_providers/weather_data_provider.dart';
import 'package:weatherapp/src/models/weather.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider = WeatherDataProvider();

  Future<Weather> getWeather(String location) async {
    final http.Response rawWeather =
        await weatherDataProvider.getRawWeatherData(location);
    final json = await jsonDecode(rawWeather.body);
    final Weather weather = Weather.fromJson(json);
    return weather;
  }

  void dispose() {}
}

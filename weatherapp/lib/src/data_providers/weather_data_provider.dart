import 'package:http/http.dart' as http;

class WeatherDataProvider {
  final String apiKey = "d18db88ad58163a71fe5747bc8009010";

  Future<http.Response> getRawWeatherData(String city) async {
    http.Response rawWeatherData = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric"),
    );
    //print(rawWeatherData.body);
    return rawWeatherData;
  }
}

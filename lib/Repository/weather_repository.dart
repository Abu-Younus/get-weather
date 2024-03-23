import 'package:http/http.dart';

class WeatherRepository {
  String baseURl =
      'https://api.openweathermap.org/data/2.5/weather?appid=64f69b996a1e2609ed8baedfd386f338';

  Future<Response> currentWeatherByLatLonRepo(double lat, double lon) async {
    Response response = await Client()
        .get(Uri.parse('$baseURl&lat=$lat&lon=$lon&units=metric'));
    return response;
  }

  Future<Response> currentWeatherByCityRepo(String cityName) async {
    Response response = await Client().get(Uri.parse('$baseURl&q=$cityName&units=metric'));
    return response;
  }
}

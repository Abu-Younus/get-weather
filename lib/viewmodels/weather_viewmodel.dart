import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import '../Repository/weather_repository.dart';
import '../models/weather.dart';

class WeatherViewModel {
  final weatherRepository = WeatherRepository();
  WeatherModel weatherData = WeatherModel();

  Future<bool> getRequestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return false;
    } else {
      return true;
    }
  }

  Future<WeatherModel> getMyLocationFormDevice() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Response response = await weatherRepository.currentWeatherByLatLonRepo(
          position.latitude, position.longitude);
      if (response.statusCode == 200) {
        weatherData = WeatherModel.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      print('My Error Block: ${error.toString()}');
    }
    return weatherData;
  }

  Future<WeatherModel> currentWeatherByCityName(String cityName) async {
    try {
      Response response =
      await weatherRepository.currentWeatherByCityRepo(cityName);
      if (response.statusCode == 200) {
        weatherData = WeatherModel.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      print('My Error Block: ${error.toString()}');
    }
    return weatherData;
  }
}


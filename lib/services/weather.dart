import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '';
const baseURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$baseURL?q=$cityName&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    double latitude = location.latitude;
    double longitude = location.longitude;

    String url =
        '$baseURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp, String cityName) {
    if (temp > 25) {
      return 'It\'s 🍦 time in $cityName';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in $cityName';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in $cityName';
    } else {
      return 'Bring a 🧥 just in case in $cityName';
    }
  }
}

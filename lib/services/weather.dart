import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const apiKey = '355472dcd7b0491499cfa9d6f74c6d52';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    var url = Uri.https('api.openweathermap.org', 'data/2.5/weather', {'q': cityName, 'units': 'metric', 'appid': apiKey});
    NetworkHelper networkHelper = NetworkHelper(myUrl: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(myUrl: Uri.https('api.openweathermap.org', 'data/2.5/weather', {'lat': location.latitude.toString(), 'lon': location.longitude.toString(), 'units': 'metric', 'appid': apiKey}));
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

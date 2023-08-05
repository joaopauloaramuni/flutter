import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/city.dart';
import 'models/weather_info.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
part 'weather_store.g.dart';

class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {
  @observable
  ObservableList<City> latlon = ObservableList<City>();
  @observable
  ObservableList<WeatherInfo> weatherData = ObservableList<WeatherInfo>();
  _WeatherStore() {
    fetchLatLon();
    fetchWeather();
  }
  @action
  Future<void> fetchLatLon() async {
    const city = 'Belo%20Horizonte';
    const String latLonApiUrl =
        'https://api.openweathermap.org/geo/1.0/direct?q=${city}&limit=1&appid=e261c6d73ce17b26589cc35bc8a2546b';
    final response = await http.get(Uri.parse(latLonApiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      latlon = data.map((item) => City.fromJson(item)).toList().asObservable();
    } else {
      latlon.clear();
    }
  }

  @action
  Future<void> fetchWeather() async {
    const city = 'Belo%20Horizonte';
    const String weatherApiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=e261c6d73ce17b26589cc35bc8a2546b';
    final response = await http.get(Uri.parse(weatherApiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      weatherData.add(WeatherInfo.fromJson(data));
    } else {
      weatherData.clear();
    }
  }

  /*
  Future<String> _getCityNameFromCoordinates(
      double latitude, double longitude) async {
    // Verificar se a permissão de localização foi concedida
    var status = await Permission.location.status;
    if (!status.isGranted) {
      // Se a permissão não foi concedida, solicitar permissão ao usuário
      status = await Permission.location.request();
      if (!status.isGranted) {
        // Se o usuário negar a permissão, retornar 'Permissão negada'
        return 'Permissão negada.';
      }
    }

    // Obter a cidade do dispositivo usando a localização
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        return placemarks.first.locality ?? 'Desconhecido';
      } else {
        return 'Desconhecido';
      }
    } catch (e) {
      print('Erro ao obter o nome da cidade: $e');
      return 'Erro ao obter a cidade.';
    }
  }*/
}

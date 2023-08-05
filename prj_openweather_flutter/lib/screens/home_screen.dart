import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../weather_store.dart';
import '../models/city.dart';
import '../models/weather_info.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final WeatherStore weatherStore;

  HomeScreen({required this.weatherStore});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.weatherStore.fetchLatLon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 0, 153),
        title: Column(
          children: [
            Text('CLIMATEMPO'),
            Text(
              'Framework',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 99, 0, 153),
        padding: EdgeInsets.all(16),
        child: Center(
          child: Observer(
            builder: (_) {
              final latLon = widget.weatherStore.latlon;
              final weatherData = widget.weatherStore.weatherData;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latitude e longitude via Geocoding API',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: latLon.length,
                      itemBuilder: (_, index) => CityCard(city: latLon[index]),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Dados do Clima via One Call API versão 2.5',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: weatherData.length,
                    itemBuilder: (_, index) =>
                        WeatherCard(weatherInfo: weatherData[index]),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Image.asset(
                      'lib/images/frame_bg.png',
                      height: 200,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 99, 0, 153),
            height: 20,
            alignment: Alignment.center,
            child: Text(
              'Criado por Aramuni - 05/08/2023',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final City city;

  CityCard({required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(city.name),
        subtitle: Text('${city.country} (${city.lat}, ${city.lon})'),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final WeatherInfo weatherInfo;

  WeatherCard({required this.weatherInfo});

  @override
  Widget build(BuildContext context) {
    final sunriseTime =
        DateTime.fromMillisecondsSinceEpoch(weatherInfo.sunrise * 1000);
    final sunsetTime =
        DateTime.fromMillisecondsSinceEpoch(weatherInfo.sunset * 1000);

    final sunriseFormatted = DateFormat('HH:mm:ss').format(sunriseTime);
    final sunsetFormatted = DateFormat('HH:mm:ss').format(sunsetTime);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(weatherInfo.cityName),
        subtitle: Text(
          'Temperatura: ${weatherInfo.temperature} °C\n'
          'Sensação térmica: ${weatherInfo.feelsLike} °C\n'
          'Descrição: ${weatherInfo.weatherDescription}\n'
          'Velocidade do vento: ${weatherInfo.windSpeed} m/s\n'
          'Direção do vento: ${weatherInfo.windDirection} graus\n'
          'Umidade do ar: ${weatherInfo.humidity} %\n'
          'Visibilidade: ${weatherInfo.visibility} m\n'
          'Pressão atmosférica: ${weatherInfo.pressure} hPa\n'
          'Temperatura mínima: ${weatherInfo.tempMin} °C\n'
          'Temperatura máxima: ${weatherInfo.tempMax} °C\n'
          'Nascer do Sol: $sunriseFormatted\n'
          'Pôr do Sol: $sunsetFormatted',
        ),
      ),
    );
  }
}

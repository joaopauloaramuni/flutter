import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'weather_store.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final WeatherStore weatherStore = WeatherStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Observer(
        builder: (_) => HomeScreen(weatherStore: weatherStore),
      ),
    );
  }
}

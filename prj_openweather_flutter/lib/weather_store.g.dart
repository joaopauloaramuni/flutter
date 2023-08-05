// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherStore on _WeatherStore, Store {
  late final _$latlonAtom =
      Atom(name: '_WeatherStore.latlon', context: context);

  @override
  ObservableList<City> get latlon {
    _$latlonAtom.reportRead();
    return super.latlon;
  }

  @override
  set latlon(ObservableList<City> value) {
    _$latlonAtom.reportWrite(value, super.latlon, () {
      super.latlon = value;
    });
  }

  late final _$weatherDataAtom =
      Atom(name: '_WeatherStore.weatherData', context: context);

  @override
  ObservableList<WeatherInfo> get weatherData {
    _$weatherDataAtom.reportRead();
    return super.weatherData;
  }

  @override
  set weatherData(ObservableList<WeatherInfo> value) {
    _$weatherDataAtom.reportWrite(value, super.weatherData, () {
      super.weatherData = value;
    });
  }

  late final _$fetchLatLonAsyncAction =
      AsyncAction('_WeatherStore.fetchLatLon', context: context);

  @override
  Future<void> fetchLatLon() {
    return _$fetchLatLonAsyncAction.run(() => super.fetchLatLon());
  }

  late final _$fetchWeatherAsyncAction =
      AsyncAction('_WeatherStore.fetchWeather', context: context);

  @override
  Future<void> fetchWeather() {
    return _$fetchWeatherAsyncAction.run(() => super.fetchWeather());
  }

  @override
  String toString() {
    return '''
latlon: ${latlon},
weatherData: ${weatherData}
    ''';
  }
}

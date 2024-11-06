class WeatherInfo {
  final String cityName;
  final String country;
  final double temperature;
  final String weatherDescription;
  final double windSpeed;
  final double feelsLike;
  final int humidity;
  final int visibility;
  final int pressure;
  final double tempMin;
  final double tempMax;
  final int sunrise;
  final int sunset;
  final int windDirection;

  WeatherInfo({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.weatherDescription,
    required this.windSpeed,
    required this.feelsLike,
    required this.humidity,
    required this.visibility,
    required this.pressure,
    required this.tempMin,
    required this.tempMax,
    required this.sunrise,
    required this.sunset,
    required this.windDirection,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      cityName: json['name'],
      country: json['sys']['country'],
      temperature: (json['main']['temp'] as num).toDouble(),
      weatherDescription: json['weather'][0]['description'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: json['main']['humidity'],
      visibility: json['visibility'],
      pressure: json['main']['pressure'],
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      windDirection: json['wind']['deg'], // Adicionando a direção do vento
    );
  }
}

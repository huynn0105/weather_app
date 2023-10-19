import 'package:weather_app/data/datasources/dtos/weather_dto.dart';

class Weather {
  final String condition;
  final double tempC;
  final double tempF;
  final String location;
  final String image;
  final String localtime;
  final String lastUpdated;
  final double lat;
  final double lon;
  final int conditionCode;
  final int humidity;
  final int cloud;
  final double uv;
  final double wind;

  const Weather({
    required this.condition,
    required this.tempC,
    required this.tempF,
    required this.image,
    required this.location,
    required this.localtime,
    required this.lastUpdated,
    required this.lat,
    required this.lon,
    required this.conditionCode,
    required this.humidity,
    required this.cloud,
    required this.uv,
    required this.wind,
  });

  factory Weather.fromDto(WeatherDto dto) {
    return Weather(
        tempC: dto.current.tempC,
                tempF: dto.current.tempF,
                location: dto.location.name,
                condition: dto.current.condition.text,
                image: 'https:${dto.current.condition.icon}'
                    .replaceAll('64x64', '128x128'),
                localtime: dto.location.localtime,
                lastUpdated: dto.current.lastUpdated,
                lat: dto.location.lat,
                lon: dto.location.lon,
                conditionCode: dto.current.condition.code,
                humidity: dto.current.humidity,
                cloud: dto.current.cloud,
                uv: dto.current.uv,
                wind: dto.current.windKph,
    );
  }
}

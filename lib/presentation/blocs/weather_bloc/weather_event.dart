part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class WeatherRequested extends WeatherEvent {
  final String city;

  WeatherRequested({required this.city});
}

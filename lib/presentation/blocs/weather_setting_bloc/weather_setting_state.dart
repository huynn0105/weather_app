part of 'weather_setting_bloc.dart';

enum Temperature{
  tempC,
  tempF,
}

class WeatherSettingState {
  final Temperature temperatureType;
  const WeatherSettingState({
    this.temperatureType = Temperature.tempC,
  });
}
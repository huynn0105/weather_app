import 'package:flutter_bloc/flutter_bloc.dart';
part 'weather_setting_state.dart';
part 'weather_setting_event.dart';

class WeatherSettingBloc
    extends Bloc<WeatherSettingEvent, WeatherSettingState> {
  WeatherSettingBloc() : super(const WeatherSettingState()) {
    on<WeatherSettingTempChanged>((event, emit) {
      if (state.temperatureType == Temperature.tempC) {
        emit(const WeatherSettingState(temperatureType: Temperature.tempF));
      } else {
        emit(const WeatherSettingState(temperatureType: Temperature.tempC));
      }
    });
  }
}

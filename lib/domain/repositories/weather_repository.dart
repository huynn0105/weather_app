import 'package:weather_app/utils/data_state.dart';

import '../../data/datasources/dtos/weather_dto.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherDto>> getWeatherByCity(String name);
}

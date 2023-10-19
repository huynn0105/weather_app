import 'package:weather_app/data/datasources/remote/weather_api_service.dart';
import 'package:weather_app/data/repositories/base/api_base_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/utils/constant.dart';
import 'package:weather_app/utils/data_state.dart';

import '../datasources/dtos/weather_dto.dart';

class WeatherRepositoryImpl extends BaseApiRepository
    implements WeatherRepository {
  final WeatherApiService _weatherApiService;

  WeatherRepositoryImpl(this._weatherApiService);
  @override
  Future<DataState<WeatherDto>> getWeatherByCity(String cityName) {
    return getStateOf<WeatherDto>(request: () {
      return _weatherApiService.getWeatherByCity(
          apiKey: defaultApiKey, cityName: cityName);
    });
  }
}

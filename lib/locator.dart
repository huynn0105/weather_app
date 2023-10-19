import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/datasources/remote/weather_api_service.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

import 'data/repositories/weather_repository_impl.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<WeatherApiService>(
    WeatherApiService(locator<Dio>()),
  );

  locator.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(locator<WeatherApiService>()),
  );
}

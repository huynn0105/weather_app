import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/data/datasources/dtos/weather_dto.dart';
import 'package:weather_app/utils/constant.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @GET('/current.json')
  Future<HttpResponse<WeatherDto>> getWeatherByCity({
    @Query("q") required String cityName,
    @Query("key") required String apiKey,
  });
}

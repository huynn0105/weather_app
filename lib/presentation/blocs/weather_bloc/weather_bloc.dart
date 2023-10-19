import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/datasources/dtos/weather_dto.dart';
import 'package:weather_app/domain/models/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/utils/data_state.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherRequested>(
      (event, emit) async {
        if (event.city.isEmpty) {
          emit(WeatherLoadFailure(message: 'Please enter city name'));
          return;
        }
        emit(WeatherLoadInProgress());
        final response =
            await locator<WeatherRepository>().getWeatherByCity(event.city);

        if (response is DataSuccess) {
          final WeatherDto weatherDto = response.data!;
          emit(
            WeatherLoadSuccess(weather: Weather.fromDto(weatherDto)),
          );
        } else if (response is DataFailed) {
          emit(WeatherLoadFailure(
            message: response.errorMessage ?? '',
          ));
        }
      },
    );
  }
}

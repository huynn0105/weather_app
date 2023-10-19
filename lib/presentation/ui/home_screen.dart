import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/models/weather.dart';
import 'package:weather_app/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/presentation/blocs/weather_setting_bloc/weather_setting_bloc.dart';
import 'package:weather_app/utils/text_style_utils.dart';
import 'package:weather_icons/weather_icons.dart';

part 'widgets/search.dart';
part 'widgets/weather_detail.dart';
part 'widgets/weather_error.dart';
part 'widgets/weather_init.dart';
part 'widgets/weather_item.dart';
part 'widgets/weather_temp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  Color color = Colors.blue.shade500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            color = getColor(state.weather.conditionCode);
          }
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.6, 0.8, 1.0],
                colors: [
                  color.withOpacity(0.6),
                  color,
                  color,
                ],
              ),
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                if (state is WeatherLoadSuccess) {
                  context
                      .read<WeatherBloc>()
                      .add(WeatherRequested(city: state.weather.location));
                }
              },
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  _Search(controller: controller),
                  const SizedBox(height: 10),
                  BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherInitial) {
                        return const _WeatherInit();
                      }
                      if (state is WeatherLoadInProgress) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is WeatherLoadSuccess) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                state.weather.location,
                                style: TextStyleUtils.bold(30),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              _WeatherTemp(
                                tempC: state.weather.tempC,
                                tempF: state.weather.tempF,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                state.weather.condition,
                                style: TextStyleUtils.medium(30),
                              ),
                              const SizedBox(height: 10),
                              Image.network(
                                state.weather.image,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Last updated',
                                style: TextStyleUtils.regular(20),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.weather.lastUpdated,
                                style: TextStyleUtils.regular(23),
                              ),
                              const SizedBox(height: 20),
                              _WeatherDetail(
                                weather: state.weather,
                              ),
                            ],
                          ),
                        );
                      } else if (state is WeatherLoadFailure) {
                        return _WeatherError(
                          message: state.message,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color getColor(int code) {
    switch (code) {
      case 1000:
      case 1003:
      case 1006:
      case 1153:
      case 1180:
      case 1183:
      case 1186:
        return const Color(0xFF259ed9);
      case 1009:
      case 1030:
      case 1135:
      case 1147:
      case 1150:
      case 1168:
      case 1171:
      case 1192:
      case 1249:
      case 1189:
      case 1063:
      case 1240:
        return const Color(0xff809ea1);

      case 1114:
      case 1066:
      case 1069:
      case 1072:
      case 1195:
      case 1198:
      case 1201:
      case 1204:
      case 1207:
      case 1255:
      case 1210:
      case 1213:
      case 1216:
      case 1219:
        return const Color(0xFF00D4F9);
      case 1252:
      case 1087:
      case 1273:
      case 1237:
      case 1276:
      case 1279:
      case 1282:
        return const Color(0xFF4F2E82);
      case 1222:
      case 1225:
      case 1243:
      case 1246:
      case 1258:
      case 1261:
      case 1264:
        return const Color(0xFF00437A);

      default:
        return const Color(0xFF1D71F2);
    }
  }
}

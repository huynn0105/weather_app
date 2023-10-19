import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weather_app/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/presentation/blocs/weather_setting_bloc/weather_setting_bloc.dart';

import 'locator.dart';
import 'presentation/ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      builder: EasyLoading.init(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(),
          ),
          BlocProvider<WeatherSettingBloc>(
              create: (context) => WeatherSettingBloc())
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

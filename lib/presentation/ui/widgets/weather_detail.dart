part of '../home_screen.dart';

class _WeatherDetail extends StatelessWidget {
  const _WeatherDetail({
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.4),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _WeatherItem(
            icon: WeatherIcons.humidity,
            name: 'Humidity',
            value: '${weather.humidity}%',
          ),
          const SizedBox(height: 5),
          _WeatherItem(
            icon: WeatherIcons.cloud,
            name: 'Cloud',
            value: '${weather.cloud}%',
          ),
          const SizedBox(height: 5),
          _WeatherItem(
            icon: WeatherIcons.day_sunny,
            name: 'UV',
            value: '${weather.uv.toInt()}',
          ),
          const SizedBox(height: 5),
          _WeatherItem(
            icon: WeatherIcons.sandstorm,
            name: 'Wind',
            value: '${weather.wind}Km/H',
          ),
        ],
      ),
    );
  }
}

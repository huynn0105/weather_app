part of '../home_screen.dart';

class _WeatherInit extends StatelessWidget {
  const _WeatherInit();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text(
            'Weather App',
            style: TextStyleUtils.bold(30),
          ),
          Image.asset(
            'assets/images/cloudy_sunny.png',
            width: 180,
            height: 180,
          ),
          const SizedBox(height: 30),
          Text(
            'Please Select a Location',
            style: TextStyleUtils.medium(25),
          ),
        ],
      ),
    );
  }
}

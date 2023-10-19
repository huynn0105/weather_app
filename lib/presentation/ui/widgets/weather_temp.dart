part of '../home_screen.dart';

class _WeatherTemp extends StatelessWidget {
  const _WeatherTemp({
    required this.tempC,
    required this.tempF,
  });
  final double tempC;
  final double tempF;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.read<WeatherSettingBloc>().add(WeatherSettingTempChanged());
        },
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<WeatherSettingBloc, WeatherSettingState>(
                builder: (context, setting) {
                  return Text(
                    setting.temperatureType == Temperature.tempC
                        ? '$tempC°C'
                        : '$tempF°F',
                    style: TextStyleUtils.medium(60),
                  );
                },
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.change_circle,
                size: 50,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}

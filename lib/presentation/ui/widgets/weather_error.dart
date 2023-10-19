part of '../home_screen.dart';

class _WeatherError extends StatelessWidget {
  const _WeatherError({
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      child: Center(
        child: Text(
          message,
          style: TextStyleUtils.medium(28),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

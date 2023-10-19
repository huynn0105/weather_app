part of '../home_screen.dart';

class _WeatherItem extends StatelessWidget {
  const _WeatherItem({
    required this.icon,
    required this.name,
    required this.value,
  });
  final String name;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BoxedIcon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 16),
        Text(
          name,
          style: TextStyleUtils.regular(22),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyleUtils.regular(22),
        ),
      ],
    );
  }
}

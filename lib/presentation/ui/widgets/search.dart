part of '../home_screen.dart';

class _Search extends StatelessWidget {
  const _Search({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: TextFormField(
        controller: controller,
        style: TextStyleUtils.regular(20),
        decoration: InputDecoration(
          enabled: true,
          iconColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: 'Enter city name',
          hintStyle: TextStyleUtils.regular(20).copyWith(
            color: Colors.white.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 26,
            vertical: 20,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.white,
              )),
          suffixIcon: IconButton(
            onPressed: () {
              context
                  .read<WeatherBloc>()
                  .add(WeatherRequested(city: controller.text));
            },
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

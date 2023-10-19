# weather_app

Flutter Weather App


## Overview 📙
The Flutter Weather App is a visually captivating and fully functional User Interface for discovering the weather status. The app allows users to access their accurate weather information in addition to some cities around the world. It provides real-time weather updates, forecasts, and more.

This Flutter Weather App is designed to provide users with accurate weather information in an intuitive and user-friendly way. It fetches data from a weather API to display the current weather details. The app is built using the clean architecture and managed with the BloC state management library, ensuring a clean and maintainable codebase.


## Features 🌟
- Discover the weather at your place (Support US zipcode, UK postcode, city name.).
- Discover the weather around the world.
- Wind speed and direction.
- Provide details on humidity, cloud, UV and wind
- Beautiful and friendly user interface.
- Error handling for API requests and network connectivity issues.


## Screenshots of the application 📷


## Getting Started
1. Get your API key by creating an account at [WeatherAPI](https://www.weatherapi.com/).
2. Clone the repository

   ```sh
   git clone https://github.com/huynn0105/weather_app.git
   ```
3. Install all the packages by running
   ```sh
   flutter pub get
   ```
4. Navigate to **lib/utils/constants.dart** and paste your API key to the mApiKey variable
   ```dart
   static const defaultApiKey = 'Your API Key';
   ```
5. Run the App
   ```dart
   flutter run
   ```
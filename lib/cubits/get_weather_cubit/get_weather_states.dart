import 'package:weather_app/models/weather_model.dart';

class GetWeatherState {}

class WeatherInitialState extends GetWeatherState {}

class WeatherLoadedState extends GetWeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});

}

class WeatherFailedState extends GetWeatherState {
  final String errorMessage;

  WeatherFailedState({required this.errorMessage});
}

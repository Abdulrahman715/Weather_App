import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherApi {
  final Dio dio;

  WeatherApi({required this.dio});

  Future<WeatherModel> getWeather({required String cityName}) async {
    var response = await dio.get(
      'https://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        'key': '1f0055a1013e4751bcf12149260202',
        'q': cityName,
        'days': 1,
      },
    );

    //! Check if the response data is a Map<String, dynamic> before parsing (Validation)

    final data = response.data;

    if(data is Map<String, dynamic>) {
      return WeatherModel.fromJson(data);
    } else {
      //! If the response data is not in the expected format, throw an exception with the error message from the API response.
      throw Exception(data['error']['message']);  
    }
  }
}

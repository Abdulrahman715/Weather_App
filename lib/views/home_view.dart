import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_body_info.dart';
import 'package:weather_app/widgets/weather_color.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? cityName;
  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: weatherModel == null
          ? Colors.grey
          : getWeatherColor(weatherModel!.weatherCondition),
      appBar: AppBar(
        elevation: 20,
        backgroundColor: weatherModel == null 
        ? Colors.grey 
        : getWeatherColor(weatherModel!.weatherCondition)[600],
        foregroundColor: Colors.white,
        

        title: Text(
          "Weather",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            //!search icon
            icon: Icon(Icons.search, size: 20),

            //! wait country from search page and save it in variable result
            onPressed: () async {
              var cityName = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchView()),
              );

              //! check if the result != null make cityName = result
              if (cityName != null) {
                WeatherApi service = WeatherApi(dio: Dio());
                weatherModel = await service.getWeather(cityName: cityName);
                setState(() {});
              }
            },
          ),
        ],
      ),

      body: weatherModel == null
          ? NoWeatherBody()
          : WeatherBodyInfo(weatherModel: weatherModel!),
    );
  }
}

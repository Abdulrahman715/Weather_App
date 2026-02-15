import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/weather_color.dart';

class WeatherBodyInfo extends StatelessWidget {
  const WeatherBodyInfo({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // getWeatherColor(weatherModel.weatherCondition).shade900,
            getWeatherColor(weatherModel.weatherCondition).shade700,
            getWeatherColor(weatherModel.weatherCondition).shade500,
            getWeatherColor(weatherModel.weatherCondition).shade300,
            getWeatherColor(weatherModel.weatherCondition).shade200,
          ],
          begin:Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    weatherModel.image,
                    width: 80,
                    height: 80,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error, size: 50);
                    },
                  ),
      
                  Text(
                    weatherModel.temp.toInt().toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
      
                  Column(
                    children: [
                      Text(
                        'MaxTemp : ${weatherModel.maxTemp.round()}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'MinTemp : ${weatherModel.minTemp.round()}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 22),
              Text(
                weatherModel.weatherCondition,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

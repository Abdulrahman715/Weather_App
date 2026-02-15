// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
// import 'package:weather_app/services/weather_api.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_body_info.dart';
// import 'package:weather_app/widgets/weather_color.dart';

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
      appBar: AppBar(
        elevation: 0,
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
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchView()),
              );

              //! check if the result != null make cityName = result
              // if (cityName != null) {
              //   WeatherApi service = WeatherApi(Dio());
              //   weatherModel = await service.getWeather(cityName: cityName);
              //   setState(() {});
              // }
            },
          ),
        ],
      ),

      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          }
          else if (state is WeatherLoadedState) {
            return WeatherBodyInfo(
              weatherModel: state.weatherModel,
            );
          }
          else {
            return Text('oops there was an error');
          }
        },
      ),
    );
  }
}

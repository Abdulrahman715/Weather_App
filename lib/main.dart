import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/widgets/weather_color.dart'; // تأكد من استيراد ملف الألوان

void main() {
  runApp(
    // وضعنا الـ Provider هنا عشان يقدر الـ BlocBuilder اللي تحته يشوفه
    BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, GetWeatherState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            // بنحدد اللون بناءً على حالة الـ State
            primarySwatch: state is WeatherLoadedState 
                ? getWeatherColor(state.weatherModel.weatherCondition)
                : Colors.blue, // اللون الافتراضي في البداية أو في حالة الخطأ
          ),
          home: const HomeView(),
        );
      },
    );
  }
}
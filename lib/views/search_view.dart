import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

// ... (الإستيرادات كما هي)

class _SearchViewState extends State<SearchView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // بنجيب اللون الحالي من الثيم اللي حددناه في الـ main
    final themeColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        // بدل اللون الثابت، بنستخدم لون الثيم
        backgroundColor: themeColor, 
        foregroundColor: Colors.white,
        title: const Text(
          'Search for a country',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                hintText: 'eg. Cairo',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.location_city),
                // استخدام لون الثيم هنا برضه
                suffixIconColor: themeColor,
                labelStyle: const TextStyle(fontSize: 20),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: themeColor), // لون الحدود عند الضغط
                ),
                filled: true,
                fillColor: Colors.white70,
              ),
              // ... باقي خصائص الـ TextField
              cursorColor: themeColor, // لون المؤشر يتبع الثيم
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor, // لون الزرار يتبع الثيم
                padding: const EdgeInsets.all(25),
              ),
              onPressed: () {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: controller.text);
                Navigator.pop(context);
              },
              child: const Text(
                "Search",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
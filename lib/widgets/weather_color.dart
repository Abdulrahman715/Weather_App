import 'package:flutter/material.dart';

MaterialColor getWeatherColor(String condition){
  if(condition.contains("Sunny") || condition.contains("Clear")){
    return Colors.orange;
  } else if(condition.contains("Cloudy") || condition.contains("Overcast")){
    return Colors.blueGrey;
  } else if(condition.contains("Rainy") || condition.contains("Showers")){
    return Colors.blue;
  } else if(condition.contains("Snowy") || condition.contains("Blizzard")){
    return Colors.cyan;
  } else if(condition.contains("Thunderstorm") || condition.contains("Stormy")){
    return Colors.deepPurple;
  } else {
    return Colors.grey;
  }
}
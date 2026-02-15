# Weather App 🌦️ (Bloc/Cubit Edition)

A modern, responsive Flutter application that fetches real-time weather data using **WeatherAPI**. This project showcases the transition from basic state management to advanced architectural patterns.

## 🚀 Overview
The app allows users to search for any city globally and get instant weather updates, including temperature, condition, and high/low temps. The entire look and feel of the app (Theme) adapts dynamically to the current weather condition.



## 🛠️ State Management: From `setState` to `Cubit`
This project was initially built using `setState` and then refactored to **Cubit (flutter_bloc)** to achieve:
* **Separation of Concerns:** Business logic is completely separated from the UI.
* **Scalability:** Easier to add new features (like caching or multiple locations).
* **Predictable States:** Managed transitions between `Initial`, `Loading`, `Loaded`, and `Failure` states.

## ✨ Key Features
* **Real-time Weather:** Integrated with [WeatherAPI](https://www.weatherapi.com/).
* **Dynamic Theming:** The app's `primarySwatch` changes automatically based on the weather (e.g., Orange for Sunny, Blue-Grey for Cloudy).
* **Cubit Architecture:** Uses `BlocProvider` and `BlocBuilder` for efficient UI updates.
* **Input Validation:** Search field includes regex filters for city names and handles empty inputs.
* **Error Handling:** Displays user-friendly messages when a city is not found.

## 🏗️ Project Structure
```text
lib/
├── cubits/          # Weather Cubit and its states
├── models/          # Data models (WeatherModel)
├── services/        # API integration (Dio)
├── views/           # UI Screens (Home, Search)
├── widgets/         # Reusable UI components
└── main.dart        # App entry point with BlocProvider

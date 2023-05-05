import 'package:flutter/material.dart';
import '../Screens/Login/otp_screen.dart';
import '../Screens/search/flight_search.dart';
import '../main.dart';
import '../Screens/search/search.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => LaunchScreen(),
  '/otp': (context) => const ScreenOtp(),
  '/flights': (context) => const FlightSearchScreen(),
  '/FlightSearchResult': (context) => const ScreenFlightSearchResult(),
};

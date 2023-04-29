import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Screens/flight_search.dart';

import '../Screens/Login/otp_screen.dart';
import '../main.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => LaunchScreen(),
  '/otp': (context) => const ScreenOtp(),
  '/flights': (context) => const FlightSearchScreen(),
};

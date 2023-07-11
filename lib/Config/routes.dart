import 'package:flutter/material.dart';
import '../Screens/Login/otp_screen.dart';
import '../Screens/search/flight_search.dart';
import '../Screens/widgets/no_connection.dart';
import '../main.dart';
import '../Screens/search/search.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => LaunchScreen(),
  '/otp': (context) => ScreenOtp(),
  '/flights': (context) => FlightSearchScreen(),
  '/FlightSearchResult': (context) => ScreenFlightSearchResult(),
  '/NoConnection': (context) => NoConnectionScreen(),

//  '/travellerDetails': (context) => TavellerDetails(),
};

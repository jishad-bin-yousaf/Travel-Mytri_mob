import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/review_flight.dart';
import '../Screens/Login/otp_screen.dart';
import '../Screens/search/flight_search.dart';
import '../Screens/search/traveller details/traveller_details.dart';
import '../main.dart';
import '../Screens/search/search.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => LaunchScreen(),
  '/otp': (context) => ScreenOtp(),
  '/flights': (context) => FlightSearchScreen(),
  '/FlightSearchResult': (context) => ScreenFlightSearchResult(),
  '/ReviewFlight': (context) => ScreenReviewFlight(),
//  '/travellerDetails': (context) => TavellerDetails(),
};

import 'package:flutter/material.dart';

import '../Screens/Login/otp_screen.dart';
import '../main.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => LaunchScreen(),
  '/otp': (context) => ScreenOtp(),
};

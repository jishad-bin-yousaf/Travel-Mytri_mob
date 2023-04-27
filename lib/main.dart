import 'dart:async';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/Home/home_screen.dart';
import 'package:travel_mytri_mobile_v1/Screens/Login/otp_screen.dart';
import 'package:travel_mytri_mobile_v1/Screens/My%20Trips/my_trips_screen.dart';

import 'Config/routes.dart';
//import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: primaryColor,
        canvasColor: tertiaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor, primary: primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(500, name: MOBILE),
          ResponsiveBreakpoint.autoScale(570, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      routes: routes,
      initialRoute: '/',
      // home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/home')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                width: 210,
                height: 144,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/T21.png'),
                    fit: BoxFit.fitWidth,
                  ),
                )),
          ),
        ],
      )),
    );
  }
}

class LaunchScreen extends StatelessWidget {
  LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          }),
    );
  }

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = [
    const ScreenHome(),
    const ScreenHome(),
    // const ScreenProfile(),
    ScreenMyTrips(),
    ScreenMyTrips(),
  ];
}

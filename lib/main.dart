import 'dart:async';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/Home/home_screen.dart';
import 'package:travel_mytri_mobile_v1/Screens/My%20Trips/my_trips_screen.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';
import 'package:travel_mytri_mobile_v1/data/model/hive_class_functions.dart';

import 'Config/routes.dart';
import 'Screens/Profile/profile.dart';
import 'Screens/My transactions/my_transactions.dart';
//import 'package:webview_flutter/webview_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TokenAdapter().typeId)) {
    Hive.registerAdapter(TokenAdapter());
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Mythri',
      theme: ThemeData(
        //   useMaterial3: true,
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
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
        ],
      ),
      routes: routes,
      initialRoute: '/',
      //  home: PaymentPage(),
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

    AuthenticationApi().noUserLogin().then((value) {
      Token toc = Token();
      if (value?.token != null) {
        toc.token = value?.token ?? '';
        setToken(toc);
      }
      (value?.status ?? false)
          ? Future.delayed(const Duration(seconds: 2), () {
              getToken().then((value) {
                Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/home'));
              });
            }
              //  () => Navigator.pushNamedAndRemoveUntil(context, '/FlightSearchResult', ModalRoute.withName('/FlightSearchResult')),
              )
          : Future.delayed(const Duration(seconds: 2), () {
              getToken().then((value) {
                Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/home'));
              });
            }
              // Future.delayed(const Duration(seconds: 5), () {
              //     getToken().then((value) {
              //       Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));
              //     });
              //   }
              //  () => Navigator.pushNamedAndRemoveUntil(context, '/FlightSearchResult', ModalRoute.withName('/FlightSearchResult')),
              );
    });
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
    ScreenHome(),
    ProfileScreen(),
    ScreenMyTrips(),
    MyTransactionsScreen(),
  ];
}

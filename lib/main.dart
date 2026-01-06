import 'package:flutter/material.dart';
import 'package:turf_upp_user/screens/home_page.dart';
import 'package:turf_upp_user/theme/app_theme.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

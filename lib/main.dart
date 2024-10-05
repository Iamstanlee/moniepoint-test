import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_moniepoint_test/core/services/navigation_service.dart';
import 'package:real_estate_moniepoint_test/core/utils/constants.dart';
import 'package:real_estate_moniepoint_test/real_estate.dart';

void main() async {
  final realEstateApp = await RealEstateApp.initializeApp();
  runZonedGuarded(() => runApp(realEstateApp), (error, trace) {
    // log
  });
}

class App extends StatefulWidget {
  const App({
    super.key,
    required this.initialRoute,
  });

  final String initialRoute;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MoniePoint Test",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kFontFamily,
        scaffoldBackgroundColor: kWhite,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: kWhite,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      onGenerateRoute: AppNavigator.onGenerateRoute,
      initialRoute: widget.initialRoute,
      builder: (_, Widget? child) => child ?? const SizedBox.shrink(),
    );
  }
}

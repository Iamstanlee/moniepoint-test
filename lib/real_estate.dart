import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/views/home.dart';
import 'package:real_estate_moniepoint_test/main.dart';

class RealEstateApp {
  static Future<Widget> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return const App(initialRoute: HomePage.route);
  }
}

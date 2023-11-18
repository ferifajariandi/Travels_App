import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/color_constract.dart';
import 'package:travels_app/helper/local_storage_helper.dart';
import 'package:travels_app/representation/screen/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travels_app/routes.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agen Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      home: const SplashScreen(),
    );
  }
}


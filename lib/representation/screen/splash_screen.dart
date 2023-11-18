import 'package:flutter/material.dart';
import 'package:travels_app/helper/asset_helper.dart';
import 'package:travels_app/helper/image_helper.dart';
import 'package:travels_app/helper/local_storage_helper.dart';
import 'package:travels_app/representation/screen/intro_screen.dart';
import 'package:travels_app/representation/screen/login/login.dart';
import 'package:travels_app/representation/screen/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = '/splash_screen';


  @override
  _SplashScreenState createState() => _SplashScreenState();
}




class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    final ignoreIntroScreen = LocalStorageHelper.getValue('ignoreIntroScreen') as bool?;

    await Future.delayed(const Duration(milliseconds: 2000));
    if(ignoreIntroScreen != null && ignoreIntroScreen){
      Navigator.of(context).push(MaterialPageRoute(

        // Jika mau diarahkan ke login dulu baru ke MainApp
        // builder: (context) => LoginScreen(),
        builder: (context) => MainApp(),
      ));
    } else {
      LocalStorageHelper.setValue('ignoreIntroScreen', true);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => IntroScreen(),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.backgroundSplash,
            fit: BoxFit.fitWidth,
          ),
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Image.asset(
              AssetHelper.circleSplash,
              width: constraints.maxWidth,
              height: constraints.maxHeight,// Menggunakan lebar maksimum dari parent
              fit: BoxFit.cover, // Sesuaikan gambar sesuai lebar
            );
          },
        )

      ],
    );
  }
}

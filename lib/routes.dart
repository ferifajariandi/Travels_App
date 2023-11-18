import 'package:flutter/material.dart';
import 'package:travels_app/data/models/hotel_models.dart';
import 'package:travels_app/representation/screen/guest_and_room_booking.dart';
import 'package:travels_app/representation/screen/hotel_booking_screen.dart';
import 'package:travels_app/representation/screen/hotel_detail_screen.dart';
import 'package:travels_app/representation/screen/hotel_screen.dart';
import 'package:travels_app/representation/screen/intro_screen.dart';
import 'package:travels_app/representation/screen/main_app.dart';
import 'package:travels_app/representation/screen/select_date_screen.dart';
import 'package:travels_app/representation/screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomBookingScreen.routeName: (context) => GuestAndRoomBookingScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      final HotelModel? hotelModel = settings.arguments as HotelModel?;
      if (hotelModel != null) {
        return MaterialPageRoute(builder: (context) {
          return HotelDetailScreen(
            hotelModel: hotelModel,
          );
        });
      }
      break;
    default:
      return null;
  }
}

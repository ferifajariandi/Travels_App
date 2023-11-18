import 'package:flutter/material.dart';
import 'package:travels_app/helper/asset_helper.dart';
import 'package:travels_app/representation/widgets/app_bar_container.dart';
import 'package:travels_app/representation/widgets/item_hotel_widget.dart';

import '../../data/models/hotel_models.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);

  static const String routeName = './hotel_screen';

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final List<HotelModel> listModel = [
    HotelModel(
      hotelImage: AssetHelper.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      star: 4.5,
      numberOfReview: 3812,
      price: 450000,
    ),
    HotelModel(hotelImage: AssetHelper.hotel2,
      hotelName: 'Hotel Grand Luxury\s',
      location: 'Banyumas, Jateng',
      awayKilometer: '164 m',
      star: 4.3,
      numberOfReview: 4221,
      price: 550000,
    ),
    HotelModel(hotelImage: AssetHelper.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '120 m',
      star: 4.6,
      numberOfReview: 4812,
      price: 350000,
    )
  ];



  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Hotel Room',
      implementLeading: true,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();

          return true;
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: listModel.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
          ),
        ),
      ),

    );
  }
}

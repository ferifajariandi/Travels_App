import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/dissmension_constract.dart';
import 'package:travels_app/helper/asset_helper.dart';
import 'package:travels_app/representation/screen/guest_and_room_booking.dart';
import 'package:travels_app/representation/screen/hotel_screen.dart';
import 'package:travels_app/representation/screen/select_date_screen.dart';
import 'package:travels_app/representation/widgets/app_bar_container.dart';
import 'package:travels_app/representation/widgets/button_widget.dart';
import 'package:travels_app/representation/widgets/item_booking_widget.dart';
import 'package:travels_app/core/constants/extension/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  static const String routeName = './hotel_booking_screen';

  @override
  _HotelBookingScreenState createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Hotel Booking',
      implementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoLocation,
              title: 'Destinasi',
              description: "Indonesia",
              onTap: () {},
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoCalendal,
              title: 'Select Date',
              description: dateSelected ?? "1 Okt - 5 Okt 2023",
              onTap: () async {
                final result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => SelectDateScreen(),
                    ));
                if (!(result as List<DateTime?>).any((element) => element == null)) {
                  dateSelected = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  setState(() {

                  });
                }
              },
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoBed,
              title: 'Guest and room',
              description: "2 Guest, 1 Room",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GuestAndRoomBookingScreen()));
              },
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HotelScreen()));

              },
            ),

          ],
        ),
      ),
    );
  }
}

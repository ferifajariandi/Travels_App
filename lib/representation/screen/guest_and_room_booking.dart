import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/dissmension_constract.dart';
import 'package:travels_app/helper/asset_helper.dart';

import '../widgets/app_bar_container.dart';
import '../widgets/button_widget.dart';
import '../widgets/item_add_guest_and_room.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  const GuestAndRoomBookingScreen({Key? key}) : super(key: key);

  static const String routeName = './guest_and_room_screen';

  @override
  _GuestAndRoomBookingScreenState createState() =>
      _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Add Guest And Room',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 1.5,
          ),
          ItemAddGuestAndRoom(
            icon: AssetHelper.icoGuest,
            innitData: 2.toString(),
            title: 'Guest',
          ),
          ItemAddGuestAndRoom(
            icon: AssetHelper.icoRoom,
            innitData: 1.toString(),
            title: 'Room',
          ),
          ButtonWidget(
            title: 'Select',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),

        ],
      ),
    );
  }
}

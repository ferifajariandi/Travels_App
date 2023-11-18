import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/dissmension_constract.dart';
import 'package:travels_app/helper/asset_helper.dart';

class ItemBookingWidget extends StatefulWidget {
  const ItemBookingWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      this.onTap,
      })
      : super(key: key);

  final String icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  _ItemBookingWidgetState createState() => _ItemBookingWidgetState();
}

class _ItemBookingWidgetState extends State<ItemBookingWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(kItemPadding),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              widget.icon,
              width: 36,
              height: 36,
            ),
            SizedBox(
              width: kItemPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                ),
                SizedBox(
                  width: kDefaultPadding,
                  height: 5,
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

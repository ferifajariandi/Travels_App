import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/dissmension_constract.dart';
import 'package:travels_app/helper/asset_helper.dart';
import 'package:travels_app/helper/image_helper.dart';
import 'package:travels_app/data/models/hotel_models.dart';
import 'package:travels_app/representation/screen/hotel_detail_screen.dart';
import 'package:travels_app/representation/widgets/button_widget.dart';
import 'package:travels_app/representation/widgets/dashline_widget.dart';

import '../../core/constants/color_constract.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({Key? key, required this.hotelModel}) : super(key: key);

  final HotelModel hotelModel;





  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  bottomRight: Radius.circular(kDefaultPadding)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoLocation),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(hotelModel.location),
                    Expanded(
                      child: Text(
                        '- ${hotelModel.awayKilometer} dari destinasi',
                        style: TextStyle(
                          color: ColorPalette.subTitleColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Row(
                    children: [
                      ImageHelper.loadFromAsset(AssetHelper.icoStar),
                      SizedBox(
                        width: kMinPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(hotelModel.star.toString()),
                      ),
                      Text(
                        '- ${hotelModel.numberOfReview} reviews',
                        style: TextStyle(
                          color: ColorPalette.subTitleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\Rp ${hotelModel.price}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Text('/Malam')
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: 'Pesan sekarang',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HotelDetailScreen(hotelModel: hotelModel,)));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class NoHighlightScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
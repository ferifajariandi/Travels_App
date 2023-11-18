import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/color_constract.dart';
import 'package:travels_app/core/constants/dissmension_constract.dart';
import 'package:travels_app/helper/asset_helper.dart';
import 'package:travels_app/helper/image_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/models/hotel_models.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({Key? key, required this.hotelModel})
      : super(key: key);

  static const String routeName = './hotel_detail_screen';
  final HotelModel hotelModel;

  @override
  _HotelDetailScreenState createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.hotelScreen,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 2,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding))),
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 2,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding))),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 18,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding * 2),
                      topRight: Radius.circular(kDefaultPadding * 2),
                    )),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kItemPadding),
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        // physics: BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Text(
                                  widget.hotelModel.hotelName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Rp${widget.hotelModel.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(' /Malam'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                ImageHelper.loadFromAsset(
                                  AssetHelper.icoLocation,
                                ),
                                SizedBox(
                                  width: kMinPadding,
                                ),
                                Text(
                                  widget.hotelModel.location,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                ImageHelper.loadFromAsset(AssetHelper.icoStar),
                                SizedBox(
                                  width: kMinPadding,
                                ),
                                Text(
                                  '${widget.hotelModel.star}/5',
                                ),
                                Text(
                                  ' (${widget.hotelModel.numberOfReview})',
                                  style: TextStyle(
                                      color: ColorPalette.subTitleColor),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Detail Informasi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 15),
                            child: Text(
                                'Kamu bisa menemukan hotel ternyaman versimu dan nikmati pelayanan terbaik yang diberikan oleh pihak hotel untuk membuatmu nyaman dan menikmati liburan'),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Lokasi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          //  tampilkan lokasi disini
                          Container(
                            height: 200,
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: LatLng(-6.2088, 106.8456),
                                // Ganti dengan koordinat yang diinginkan
                                zoom: 15,
                              ),
                              markers: {
                                Marker(
                                  markerId: MarkerId('Marker'),
                                  position: LatLng(-6.2088, 106.8456), // Ganti dengan koordinat yang diinginkan
                                ),
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

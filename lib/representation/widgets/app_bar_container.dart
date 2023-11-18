import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/color_constract.dart';
import 'package:travels_app/core/constants/dissmension_constract.dart';
import 'package:travels_app/helper/asset_helper.dart';
import 'package:travels_app/helper/image_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarContainerWidget extends StatefulWidget {
  const AppBarContainerWidget({
    Key? key,
    required this.child,
    this.implementLeading = false,
    required this.titleString,
    this.implementTraling = false,
    this.title,
  }) : super(key: key);

  final Widget? title;
  final Widget child;
  final String? titleString;
  final bool implementLeading;
  final bool implementTraling;

  @override
  _AppBarContainerWidgetState createState() => _AppBarContainerWidgetState();
}

class _AppBarContainerWidgetState extends State<AppBarContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: widget.title ??
                  Row(
                    children: [
                      if (widget.implementLeading)
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding),
                              ),
                              color: Colors.white,
                            ),
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                widget.titleString ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: Gradients.defaultGradientBackground,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(35))),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFromAsset(
                      AssetHelper.icoOvalTop,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFromAsset(
                      AssetHelper.icoOvalBottom,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 156),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: widget.child,
          )
        ],
      ),
    );
  }
}

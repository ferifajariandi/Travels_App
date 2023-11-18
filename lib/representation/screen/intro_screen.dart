import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/dissmension_constract.dart';
import 'package:travels_app/helper/asset_helper.dart';
import 'package:travels_app/helper/image_helper.dart';
import 'package:travels_app/core/constants/textstyle_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travels_app/representation/screen/login/login.dart';
import 'package:travels_app/representation/screen/main_app.dart';
import 'package:travels_app/representation/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static String routeName = 'intro_screen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(
      String image, String title, String description, Alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 420,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          height: kMediumPadding * 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kMediumPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            _buildItemIntroScreen(
              AssetHelper.slide1,
              'Back to flight',
              'Found a flight that matches your destination and schedule? Book it instantly.',
              Alignment.centerRight,
            ),
            _buildItemIntroScreen(
                AssetHelper.slide2,
                'Find a hotel roo',
                'Select the day, book your room. We give you the best price.',
                Alignment.center),
            _buildItemIntroScreen(
              AssetHelper.slide3,
              'Enjoy your trip',
              'Easy discovering new places and share these between your friends and travel together.',
              Alignment.centerLeft,
            ),
          ],
        ),
        Positioned(
          left: kMediumPadding,
          right: kMediumPadding,
          bottom: kMediumPadding * 0.6,
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotHeight: kMinPadding,
                    dotWidth: kMinPadding,
                    activeDotColor: Colors.orange,
                  ),
                ),
              ),
              StreamBuilder<int>(
                initialData: 0,
                stream: _pageStreamController.stream,
                builder: (context, snapshot) {
                  return Expanded(
                    flex: 4,
                    child: ButtonWidget(
                      title: snapshot.data != 2 ? 'Next' : 'Get started',
                      onTap: () {
                        if (_pageController.page != 2) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                              (Route<dynamic> route) => false,
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}

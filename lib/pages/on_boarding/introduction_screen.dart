import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../main.dart';
import '../../utils/colors.dart';
import '../../widgets/_common/entity/slider_entity.dart';
import '../../widgets/_common/widget/round_corners_button_widget.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  var pageController = PageController(initialPage: 0);
  var pageViewModelData = [];

  Timer? sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    pageViewModelData.addAll(SliderData.introSliderData);

    sliderTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(MediaQuery.of(context).size.width * 2,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sliderTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColors.foreGroundColor,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                pageSnapping: true,
                onPageChanged: (index) {
                  currentShowIndex = index;
                },
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  PagePopup(imageData: pageViewModelData[0]),
                  PagePopup(imageData: pageViewModelData[1]),
                  PagePopup(imageData: pageViewModelData[2]),
                ],
              ),
            ),
            SmoothPageIndicator(
              count: 3,
              effect: WormEffect(
                  radius: 10.0,
                  spacing: 5.0,
                  dotColor: AppColors.secondaryBackgroundColor,
                  activeDotColor: AppColors.accentColor),
              controller: pageController,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 48, right: 48, bottom: 36, top: 32),
                child: RoundCornerButtonWidget(
                  buttonKey: Key('btn_login'),
                  bgColor: AppColors.buttonColor,
                  title: "Start Now",
                  textColor: AppColors.primaryBackgroundColor,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.ChooseAccountTypePage);
                  },
                )),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 40,
            )
          ],
        ),
      ),
    );
  }
}

class PagePopup extends StatelessWidget {
  final SliderData? imageData;

  const PagePopup({Key? key, this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 120,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  imageData!.assetsImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              imageData!.titleText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              imageData!.subText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}

import 'package:booking_app/pages/hotels/hotel_details.dart';
import 'package:booking_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class HomePageBody extends StatefulWidget {

  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  late double _currentPageValue = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int featuredHotelCards = 5;
    return Column(
      children: [
        // const BigText(text:'Find Your Stay at Book@t', size: 30),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              BigText(text: 'Featured', size: 24, color: AppColors.primaryTextColor),
              SmallText(text: 'Show All', color: Colors.transparent, size: 14),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Container(
            height: 320,
            child: PageView.builder(
              itemCount: featuredHotelCards,
              controller: pageController,
              itemBuilder: (BuildContext context, int index) {
                return _buildPageItem(index);
              },
            ),
          ),
        ),
        const SizedBox(height: 20,),
        DotsIndicator(
          dotsCount: featuredHotelCards,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    int i = index + 1;
    return Stack(
      children: [
        GestureDetector(
          onTap: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HotelDetails()),
            );
          },
          child: Container(
            height: 260,
            margin: const EdgeInsets.only(right:20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.accentColor,
              image: DecorationImage(
                image: AssetImage('assets/hotel/hotel_$i.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            width: double.infinity,
            margin: const EdgeInsets.only(right:30, left: 10, bottom: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF332d2b).withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(30),
              ),
              color: AppColors.secondaryBackgroundColor,
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const BigText(text: 'Grand Palace Boutique Hotel'),
                  Row(
                    children: const [
                    BigText(text: '\$500', color: AppColors.accentColor),
                    SmallText(text: '  per night', color: AppColors.primaryTextColor, size: 14,),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                          color: AppColors.iconColor,
                      ),
                      SmallText(text: ' Denver, Colorado', color: AppColors.iconColor, size: 16)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

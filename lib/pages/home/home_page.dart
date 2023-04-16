import 'package:booking_app/pages/home/home_page_body.dart';
import 'package:booking_app/pages/home/home_page_search_and_filter.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.secondaryBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left:20, right:20),
              margin: const EdgeInsets.only(top:45, bottom:15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SmallText(text: 'Bitung, Chilseagi', color: AppColors.primaryTextColor),
                  Icon(Icons.notifications, color: AppColors.buttonColor, size: 30),
                ],
              ),
            ),
            SearchAndFilter(),
            HomePageBody(),
          ],
        ),
      bottomNavigationBar: Container(
        color: AppColors.buttonColor,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            backgroundColor: AppColors.buttonColor,
            color: AppColors.secondaryBackgroundColor,
            activeColor: AppColors.primaryBackgroundColor,
            tabBackgroundColor: AppColors.iconColor,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.favorite_border, text: 'Likes'),
              GButton(icon: Icons.bookmark_outline, text: 'Booking'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

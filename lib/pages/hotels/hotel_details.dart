import 'package:booking_app/utils/colors.dart';
import 'package:booking_app/utils/constants.dart';
import 'package:booking_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: foodDetailImageHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/hotel/hotel_1.png'),
                  fit: BoxFit.cover,
                )
              ),
          )),
          //Top bar Navigation Buttons
          Positioned(
            top: 45,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context
                    );
                  }
                  ,child: AppIcon(icon: Icons.keyboard_arrow_left)),
                AppIcon(icon: Icons.favorite_outline),
              ],
            ),
          ),
          //Description Area
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: foodDetailImageHeight - 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: AppColors.primaryBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(text: "Hotel Plaza Bellagio", size: 24,),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 20,
                                color: AppColors.iconColor,
                              ),
                              SmallText(text: ' Denver, Colorado', color: AppColors.iconColor, size: 15)
                            ],
                          ),
                          const SizedBox(height: 1,),
                          Row(
                            children: const [
                              Icon(
                                Icons.person,
                                size: 20,
                                color: AppColors.iconColor,
                              ),
                              SmallText(text: ' King James', color: AppColors.iconColor, size: 15)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          BigText(text: '\$500', color: AppColors.accentColor, size: 26,),
                          SmallText(text: '  per night', color: AppColors.primaryTextColor, size: 16,),
                        ],
                      ),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top:20, bottom: 20),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColors.foreGroundColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.bed_outlined),
                            SmallText(text: '4 bedrooms', color: AppColors.primaryTextColor, size: 14,),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.hot_tub_outlined),
                            SmallText(text: '2 bathrooms', color: AppColors.primaryTextColor, size: 14,),
                          ],
                        )
                        ,Row(
                          children: const [
                            Icon(Icons.emoji_food_beverage_outlined),
                            SmallText(text: 'Breakfast', color: AppColors.primaryTextColor, size: 14),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SmallText(text: "Description", size: 20, color: AppColors.primaryTextColor,),
                  Expanded(child: SingleChildScrollView(child: ExpandableText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sagittis, ligula eu tempor viverra, mi metus placerat mauris, at lobortis ante nisl at elit. Mauris ultricies velit leo, ut porta turpis facilisis vitae. Etiam vitae tellus at libero dictum ultricies ut sed est. Vestibulum ante ex, tempor in nulla eget, mattis semper erat. Pellentesque at cursus metus. Ut pharetra mi in turpis laoreet eleifend. Suspendisse placerat quis neque a iaculis. Integer sit amet purus eget ex dictum mattis nec quis leo. Quisque vel mauris scelerisque, condimentum neque non, sodales nibh. Nullam eu sapien luctus, suscipit orci in, tincidunt augue. Vivamus nisi ex, commodo nec sem ac, commodo consectetur justo. Maecenas in porttitor nunc. Fusce aliquet mi metus, sit amet sollicitudin tortor ullamcorper ultrices. Donec sit amet mattis felis, et tempor orci. Donec ut rutrum sem. Praesent dapibus pellentesque ultricies. Phasellus vehicula vitae ante quis pulvinar. Nullam vel tempor quam. Vivamus.'))),
                ],
              ),
            ),
          ),
          //
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
        child: ElevatedButton(
          onPressed: () {  },
          style:  ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.buttonColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon(Icons.arrow_forward,
                size: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'owner_hotel_listing.dart';
import 'owner_profile_page.dart';
import 'package:http/http.dart' as http;

class OwnerPropertyPage extends StatefulWidget {
  dynamic owner;
  OwnerPropertyPage({Key? key, required this.owner}) : super(key: key);

  @override
  State<OwnerPropertyPage> createState() => _OwnerPropertyPageState(owner);
}

class _OwnerPropertyPageState extends State<OwnerPropertyPage> {
  dynamic owner;
  _OwnerPropertyPageState(this.owner);

  List<dynamic> hotels = [];

  @override
  void initState() {
    // TODO: implement initState
    getOwnerHotels();
    super.initState();
  }

  Future<void> getOwnerHotels() async {
    String url = "http://10.0.2.2:8000/api/hotels/?id=9";
    final response = await http.get(Uri.parse(url));
      print(response.body);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON string.
      print(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.foreGroundColor,
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.only(top: 55,bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const BigText(
                          text: 'Your Listings',
                          size: 24,
                          color: AppColors.primaryTextColor),
                      Icon(Icons.notifications,
                          color: AppColors.buttonColor.withOpacity(0.0),
                          size: 30),
                    ],
                  ),
                ),
                Container(
                  height: 600,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildPageItem(index);
                    },

                  ),
                )
              ],
            ),
          ],
        ),

      bottomNavigationBar: Container(
        color: AppColors.buttonColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            backgroundColor: AppColors.buttonColor,
            color: AppColors.secondaryBackgroundColor,
            activeColor: AppColors.primaryBackgroundColor,
            tabBackgroundColor: AppColors.iconColor,
            selectedIndex: 1,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                  icon: Icons.add_circle_outline,
                  text: 'Listing',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OwnerHotelListingPage(owner: owner)
                      ),
                    );
                  }),
              GButton(
                  icon: Icons.list_alt_outlined,
                  text: 'Property',
                  onPressed: () {

                  }),
              GButton(
                  icon: Icons.bookmark_outline,
                  text: 'Orders',
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => OwnerProfilePage(owner: owner)
                    //   ),
                    // );
                  }),
              GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OwnerProfilePage(owner: owner)
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    int i = index + 1;
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: ()
              {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => HotelDetails()),
                // );
              },
              child: Container(
                height: 260,
                // margin: const EdgeInsets.only(right:20),
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
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}

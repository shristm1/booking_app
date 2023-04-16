import 'package:booking_app/pages/authentication/presentation/pages/owner_sign_up_page.dart';
import 'package:booking_app/pages/owner/owner_hotel_listing.dart';
import 'package:booking_app/pages/owner/owner_property_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/icon_box.dart';
import '../../widgets/setting_item.dart';

class OwnerProfilePage extends StatefulWidget {
  dynamic owner;
  OwnerProfilePage({Key? key, required this.owner}) : super(key: key);

  @override
  State<OwnerProfilePage> createState() => _OwnerProfilePageState(owner);
}

class _OwnerProfilePageState extends State<OwnerProfilePage> {

  dynamic owner;
  _OwnerProfilePageState(this.owner);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.foreGroundColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.secondaryBackgroundColor,
              pinned: true,
              snap: true,
              floating: true,
              title: getAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => buildBody(),
                childCount: 1,
              ),
            )
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
              gap: 8,
              padding: EdgeInsets.all(16),
              selectedIndex: 3,
              tabs: [
                GButton(
                    icon: Icons.add_circle_outline,
                    text: 'Listing',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OwnerHotelListingPage(owner: owner)),
                      );
                    }),
                GButton(
                    icon: Icons.list_alt_outlined,
                    text: 'Property',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OwnerPropertyPage(owner: owner)),
                      );
                    }),
                GButton(
                    icon: Icons.bookmark_outline,
                    text: 'Orders',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OwnerHotelListingPage(owner: owner)),
                      );
                    }),
                GButton(
                    active: true,
                    icon: Icons.person,
                    text: 'Profile',
                    onPressed: () {

                    }),
              ],
            ),
          ),
        ));
  }

  Widget getAppBar() {
    return Container(
      child: Text(
        "Profile",
        style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 24,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50,),
                Container(
                  height: 60,
                  width: 60,
                  child: Container(child: FittedBox(fit: BoxFit.fill, child: Icon(Icons.person, color: AppColors.accentColor))),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  owner['name'],
                  style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          SettingItem(
              title: owner['address'],
              leadingIcon: Icons.location_on_outlined,
              leadingIconColor: AppColors.accentColor,
              onTap: () {}),
          SizedBox(height: 15),
          SettingItem(
              title: owner['email'],
              leadingIcon: Icons.email_outlined,
              leadingIconColor: Colors.blue,
              onTap: () {}),
          SizedBox(height: 15),
          SettingItem(
              title: owner['contact'],
              leadingIcon: Icons.phone,
              leadingIconColor: Colors.red,
              onTap: () {}),
          SizedBox(height: 15),

          SettingItem(
            title: "Log Out",
            leadingIcon: Icons.logout_outlined,
            leadingIconColor: Colors.red.shade400,
            onTap: () {
              showConfirmLogout();
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
  showConfirmLogout() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: Text("Would you like to log out?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OwnerSignupPage()
                ),
              );
            },
            child: const Text(
              "Log Out",
              style: TextStyle(color: AppColors.buttonColor),
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

import 'package:booking_app/pages/authentication/presentation/pages/owner_login_page.dart';
import 'package:booking_app/pages/authentication/presentation/pages/owner_sign_up_page.dart';
import 'package:booking_app/pages/authentication/presentation/pages/user_login_page.dart';
import 'package:booking_app/pages/authentication/presentation/pages/user_signup_page.dart';
import 'package:booking_app/pages/home/home_page.dart';
import 'package:booking_app/pages/hotels/hotel_details.dart';
import 'package:booking_app/pages/on_boarding/choose_account_type.dart';
import 'package:booking_app/pages/owner/owner_hotel_listing.dart';
import 'package:booking_app/pages/owner/owner_profile_page.dart';
import 'package:booking_app/pages/owner/owner_property_page.dart';
import 'package:booking_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/pages/on_boarding/splash_screen.dart';
import 'utils/dependencies.dart' as dep;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static restartApp(BuildContext context) {
    final _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;

    state.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      navigatorKey = GlobalKey<NavigatorState>();
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      key: key,
      color: AppColors.primaryBackgroundColor,
      child: MaterialApp(
        title: 'Hotel',
        debugShowCheckedModeBanner: false,
        routes: routes,
        navigatorKey: navigatorKey,
    ));
  }

  var routes = <String, WidgetBuilder>{
    Routes.SPLASH: (BuildContext context) => SplashPage(),
    Routes.TabScreen: (BuildContext context) => HomePage(),
    Routes.UserLoginPage: (BuildContext context) => UserLoginPage(),
    Routes.OwnerLoginPage:(BuildContext context) => OwnerLoginPage(),
    Routes.UserSignupPage: (BuildContext context) => UserSignUpPage(),
    Routes.OwnerSignupPage: (BuildContext context) => OwnerSignupPage(),
    Routes.HotelDetailsPage: (BuildContext context) => HotelDetails(),
    Routes.ChooseAccountTypePage: (BuildContext context) => ChooseAccountTypePage(),
    Routes.OwnerListingPage:(BuildContext context) =>OwnerHotelListingPage(owner: null,),
    Routes.OwnerProfilePage: (BuildContext context) => OwnerProfilePage(owner: null,),
    Routes.OwnerPropertyPage: (BuildContext context) => OwnerPropertyPage(owner: null,),
  };
}

class Routes {
  static const String SPLASH = "/";
  static const String OwnerListingPage = "/owner_listing_page";
  // static const String SPLASH = "/splash";
  // static const String OwnerListingPage = "/";
  static const String ChooseAccountTypePage = "/choose_account_type_page";
  static const String TabScreen = "/dashboard_page";
  static const String UserLoginPage = "/user_login_page";
  static const String UserSignupPage = "/user_signup_page";
  static const String OwnerLoginPage = "/owner_login_page";
  static const String OwnerSignupPage = "/owner_signup_page";
  static const String HotelDetailsPage = "/hotel_details_page";
  static const String OwnerProfilePage = "/owner_profile_page";
  static const String OwnerPropertyPage = "/owner_property_page";
}


import 'package:booking_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';
import 'introduction_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              foregroundDecoration:
                  BoxDecoration(
                  color:
                  AppColors.primaryBackgroundColor.withOpacity(0.4)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/introduction.jpg',
                  fit: BoxFit.cover),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: AppColors.secondaryBackgroundColor,
                            offset: Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      child: Image.asset('assets/images/appIcon.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Book@t",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Best hotel deals for your holiday",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 48, right: 48, bottom: 40, top: 8),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),

                    ),
                    child: InkWell(
                      key: Key('txt_get_started'),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      highlightColor: Colors.transparent,
                      onTap: () {
                        // Get.toNamed(Routes.LoginPage);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IntroductionPage()),
                        );
                      },
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

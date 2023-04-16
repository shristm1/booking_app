import 'package:booking_app/pages/authentication/presentation/pages/owner_sign_up_page.dart';
import 'package:booking_app/pages/authentication/presentation/pages/user_signup_page.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/_common/widget/round_corner_text_input_widget.dart';
import '../../widgets/_common/widget/round_corners_button_widget.dart';
import '../../widgets/big_text.dart';

class ChooseAccountTypePage extends StatefulWidget {
  const ChooseAccountTypePage({Key? key}) : super(key: key);

  @override
  State<ChooseAccountTypePage> createState() => _ChooseAccountTypePageState();
}

class _ChooseAccountTypePageState extends State<ChooseAccountTypePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColors.foreGroundColor,
          body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration:
            BoxDecoration(
            color: AppColors.primaryBackgroundColor.withOpacity(0.5)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/images/pattern_background.jpg',
              fit: BoxFit.cover,
            ),
          ),Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: appBar(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 120,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserSignUpPage()),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(8),
                                  ),
                                  child: Image.asset('assets/images/user_image.jpg',
                                    fit: BoxFit.cover,
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                BigText(text: "User"),
                              ],
                            ),
                            SizedBox(height: 40,),


                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OwnerSignupPage()),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(8),
                                  ),
                                  child: Image.asset('assets/images/owner_image.jpg',
                                    fit: BoxFit.cover,
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                BigText(text: "Owner"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          ],
        ),
      )
    );
  }

  Widget appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: AppBar().preferredSize.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: SizedBox(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4, left: 24),
          child: Text(
            "Choose Account Type",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }
}

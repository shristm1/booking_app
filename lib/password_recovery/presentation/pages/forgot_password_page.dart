import 'package:booking_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColors.foreGroundColor,
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: appBar(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 35,),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 24, right: 24),
                        child: Row(
                          children: <Widget>[

                            Text(
                              "Enter your email to receive an email to\nreset your password",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.iconColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryBackgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            // border: Border.all(
                            //   color: HexColor("#757575").withOpacity(0.6),
                            // ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: AppColors.iconColor.withOpacity(0.5),
                                  blurRadius: 8,
                                  offset: Offset(2, 2)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Container(
                              height: 48,
                              child: Center(
                                child:TextField(
                              maxLines: 1,
                              onChanged: (String txt) {},
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              cursorColor: AppColors.primaryTextColor,
                              decoration: new InputDecoration(
                                errorText: null,
                                border: InputBorder.none,
                                hintText: "Your Email",
                                hintStyle: TextStyle(color: AppColors.iconColor),
                              ),
                            ),),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 26),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: AppColors.iconColor,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(24.0)),
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text(
                                "Send",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
            padding: EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 24),
          child: Text(
            "Forgot Password",
            style: new TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

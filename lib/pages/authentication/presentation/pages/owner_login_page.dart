import 'dart:convert';

import 'package:booking_app/pages/authentication/presentation/pages/owner_sign_up_page.dart';
import 'package:booking_app/pages/owner/owner_hotel_listing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/colors.dart';
import '../../../../utils/validators/login_validator.dart';
import '../../../../widgets/_common/widget/round_corner_text_input_widget.dart';
import '../../../../widgets/_common/widget/round_corners_button_widget.dart';
import '../../../on_boarding/choose_account_type.dart';
import '../../domain/entities/login_entity.dart';

class OwnerLoginPage extends StatefulWidget {
  const OwnerLoginPage({Key? key}) : super(key: key);

  @override
  State<OwnerLoginPage> createState() => _OwnerLoginPageState();
}

class _OwnerLoginPageState extends State<OwnerLoginPage> {

  late LoginEntity _loginEntity;
  String _loginStatus = '';
  final String _url = 'http://10.0.2.2:8000/api/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };

  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  _login() async {

    var data = {
      'email' : emailController.text,
      'password' : passController.text,
    };
    // debugPrint(nameController.text);
    // debugPrint(emailController.text);
    // debugPrint(passController.text);
    // debugPrint(addressController.text);
    // debugPrint(contactController.text);

    var res = await postData(data, 'auth/loginOwner');
    var body = json.decode(res.body);

    print(body['owner']);
    if(body['success']){
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => OwnerHotelListingPage(owner: body['owner'])
          )
      );
    }
    else {
      setState(() {
        _loginStatus = body['message'];
      });
    }
  }


  @override
  void initState() {
    super.initState();
    _loginEntity = LoginEntity();
  }

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
                padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: appBar(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 80,),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: RoundCornerTextInputWidget(
                          inputTextKey: const Key('txt_email'),
                          hintText: 'Your Email',
                          controller: emailController,
                          onChange: (v) {
                            _loginEntity.email = v;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 20),
                        child: RoundCornerTextInputWidget(
                          inputTextKey: const Key('txt_password'),
                          hintText: 'Password',
                          controller: passController,
                          onChange: (v) {
                            _loginEntity.password = v;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 8, right: 16, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           ForgotPasswordPage()),
                                // );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Forgot your password',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.accentColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 10, top: 8),
                        child: RoundCornerButtonWidget(
                          buttonKey: const Key('btn_login'),
                          title: 'Login',
                          textColor: AppColors.primaryBackgroundColor,
                          bgColor: AppColors.buttonColor,
                          onTap: () {
                            setState(() {
                              var validationStatus = LoginValidator(
                                  email: _loginEntity.email,
                                  password: _loginEntity.password)
                                  .validate();

                              if (validationStatus == "Validation Successful") {
                                _login();
                              }
                            });
                          },
                        ),
                      ),
                      Text(
                        _loginStatus.toString(),
                        key: Key('txt_error'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Don't have account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                          InkWell(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            onTap: () {
                              Navigator.pop(
                                context
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Create an account",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.accentColor,
                                ),
                              ),
                            ),
                          ),
                        ],
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
          height: AppBar(
            automaticallyImplyLeading: false,
          ).preferredSize.height,
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
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => ChooseAccountTypePage()
                      )
                  );
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
            "Owner Login",
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

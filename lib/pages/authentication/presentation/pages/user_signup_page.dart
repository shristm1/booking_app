import 'dart:convert';

import 'package:booking_app/pages/home/home_page.dart';
import 'package:booking_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/api/api_client.dart';
import '../../../../data/controllers/signup_controller.dart';
import '../../../../main.dart';
import '../../../../utils/validators/signup_validator.dart';
import '../../../../widgets/_common/widget/round_corner_text_input_widget.dart';
import '../../../../widgets/_common/widget/round_corners_button_widget.dart';
import '../../../on_boarding/choose_account_type.dart';
import '../../domain/entities/signup_entity.dart';
import 'user_login_page.dart';
import 'package:http/http.dart' as http;

class UserSignUpPage extends StatefulWidget {
  @override
  _UserSignUpPageState createState() => _UserSignUpPageState();
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  late SignupEntity _entity;
  String _signUpStatus = '';

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

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  _register() async {
    var data = {
      'name'  :nameController.text,
      'email' : emailController.text,
      'address' : addressController.text,
      'contact' : contactController.text,
      'password' : passController.text,
    };
    // debugPrint(nameController.text);
    // debugPrint(emailController.text);
    // debugPrint(passController.text);
    // debugPrint(addressController.text);
    // debugPrint(contactController.text);

    var res = await postData(data, 'auth/register');
    var body = json.decode(res.body);


    if(body['success']){
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => HomePage()
          )
      );
    }
    else {
      _signUpStatus = body.message;
      print(_signUpStatus);
    }
  }

  @override
  void initState() {
    super.initState();
    _entity = SignupEntity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 20),
                      child: RoundCornerTextInputWidget(
                        inputTextKey: const Key('txt_full_name'),
                        hintText: 'Full Name',
                        controller: nameController,
                        onChange: (v) {
                          _entity.fullName = v;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 20),
                      child: RoundCornerTextInputWidget(
                        inputTextKey: const Key('txt_contact'),
                        hintText: 'Contact',
                        controller: contactController,
                        onChange: (v) {
                          _entity.contact = v;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 20),
                      child: RoundCornerTextInputWidget(
                        inputTextKey: const Key('txt_address'),
                        controller: addressController,
                        hintText: 'Address',
                        onChange: (v) {
                          _entity.address = v;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: RoundCornerTextInputWidget(
                        inputTextKey: const Key('txt_email'),
                        hintText: 'Email',
                        controller: emailController,
                        onChange: (v) {
                          _entity.email = v;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: RoundCornerTextInputWidget(
                        inputTextKey: const Key('txt_password'),
                        controller: passController,
                        hintText: "Password",
                        onChange: (v) {
                          _entity.password = v;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 8, top: 34),
                      child: RoundCornerButtonWidget(
                        buttonKey: const Key('btn_signup'),
                        title: 'Sign up',
                        bgColor: AppColors.buttonColor,
                        textColor: AppColors.primaryBackgroundColor,
                        onTap: () {
                          setState(() {
                            _signUpStatus = SignupValidator(
                                    fullName: _entity.fullName,
                                    contact: _entity.contact,
                                    address: _entity.address,
                                    email: _entity.email,
                                    password: _entity.password)
                                .validate();

                            if (_signUpStatus == 'Validation Successful')
                              {
                                _register();
                              }
                          });
                        },
                      ),
                    ),
                    Text(
                      _signUpStatus.toString(),
                      key: const Key('txt_error'),
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "By signing up, you agreed with our terms of\nServices and privacy Policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have account",
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserLoginPage()),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Login",
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
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 24,
                    )
                  ],
                ),
              ),
            )
          ],
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
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
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
            "User Sign up",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

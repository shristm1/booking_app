import 'dart:convert';

import 'package:booking_app/utils/constants.dart';
import 'package:booking_app/widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {

  SignupController(
      {required this.name,
      required this.contact,
      required this.address,
      required this.email,
      required this.password
    });

  String name;
  String contact;
  String address;
  String email;
  String password;
  
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  signUpUser() async {
    var response = await http.post(Uri.parse(baseUrl+'register'), body: {
      "name":name,
      "contact":contact,
      "address":address,
      "email":email,
      "password":password,
    });

    var res = await json.decode(response.body);
    print(res);
    if(res['success']){
      CustomSnackBar('Sign up', 'Signup Successful', 'success');
      // Navigator.push(
      //   context as BuildContext,
      //   MaterialPageRoute(
      //       builder: (context) => LoginPage()),
      // );

    } else {
      CustomSnackBar('Sign up', 'Sign up failed', 'error');
    }
  }
}
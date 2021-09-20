import 'package:flutter/material.dart';

class ValidationMixin {
  String emailValidation(String value) {
    if (!value.contains("@") && !value.contains(".com")) {
      return 'You have missed the @ or .com';
    }
    return null;
  }


  String passwordValidation (String value){
    if(value.length < 7){
      return 'password should be of 8 Characters';
    }
    return null;
  }

}
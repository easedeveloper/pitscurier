

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  String email = '';
  String passw = '';
  int    afire = 0;

  bool _isloading = false;

  bool get getIsLoading => _isloading;
  set setIsLoading( bool value ){
    this._isloading = value;
    notifyListeners();
  }

  bool isValidationForm(){
    return formkey.currentState?.validate() ?? false;
  }


}
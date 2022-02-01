import 'package:flutter/material.dart';
import 'package:pitscurier/models/products_modelos.dart';

class ProductFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ProductModel productM;

  ProductFormProvider( this.productM );

  bool isValidForm(){
    return formkey.currentState?.validate() ?? false;
  }

}


import 'package:flutter/material.dart';
import 'package:pitscurier/screens/detallescreen.dart';
import 'package:pitscurier/screens/homescreen.dart';
import 'package:pitscurier/screens/loginscreen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

  '/login' : (_) => LoginScreen(),
  '/home' : (_) => HomeScreen(),
  '/detalle' : (_) => DetalleScreen(),

};
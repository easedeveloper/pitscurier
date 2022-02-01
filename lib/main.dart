import 'package:flutter/material.dart';
import 'package:pitscurier/screens/detallescreen.dart';
import 'package:pitscurier/screens/homescreen.dart';
import 'package:pitscurier/screens/loginscreen.dart';
import 'package:pitscurier/services/product_services.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductServices()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pits Curier',
      initialRoute: '/detalle',
      routes: {
        '/login'  : (_)=> LoginScreen(),
        '/home'   : (_)=> HomeScreen(),
        '/detalle': (_)=> DetalleScreen(),
      },

      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300]
      ),
    );
  }
}


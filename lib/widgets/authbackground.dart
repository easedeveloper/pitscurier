import 'package:flutter/material.dart';

class AuthBackGround extends StatelessWidget {
  final Widget childABG;
  AuthBackGround({ required this.childABG });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _OrangeBox(),

          _HeaderLogo(),

          this.childABG

        ],
      ),
    );
  }
}

class _OrangeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _colorBackground(),
      
    );
  }

  BoxDecoration _colorBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(249, 183, 29, 1),
        Color.fromRGBO(249, 183, 29, 1),
      ]
    )
  );
}

class _HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
        child: Image(
          image: AssetImage('assets/pclogo.png'),
        )
      ),
    );
  }
}
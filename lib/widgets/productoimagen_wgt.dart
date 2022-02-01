import 'package:flutter/material.dart';

class ProductoImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: 90,
        height: 90,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
        
            child: getImage(  ),
              
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.black12,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        blurRadius: 10,
        offset: Offset(0,5),
      )
    ]
  );
}

Widget getImage(){
  return Image(
    image: AssetImage('assets/no-image.png'),
    fit: BoxFit.cover,
  );
}



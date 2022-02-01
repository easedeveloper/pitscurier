import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  //fina TaskModel taskm;
  //TaskCard({});
  final int status = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Container(
        margin: EdgeInsets.only( top: 30, bottom: 10 ),
        width: double.infinity,
        height: 220,
        decoration: _cardBordes(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _TaskDetails(),

            Positioned(
              top: 90,
              right:7,
              child: _StatusStack( status ),
            )
          ],
        ),
      ),
   );
  }
  BoxDecoration _cardBordes() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0,7),
          blurRadius: 10
        )
      ]
  );
}


class _TaskDetails extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only( right: 60 ),
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
        width: double.infinity,
        height: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Destino: Asociacion de vivienda los Leoncitos',
              style: TextStyle( fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow:  TextOverflow.ellipsis,
            ),
            Text(
              'Av. El Amargon Na 4246 Urb. Micaela Bastidas Los Olivos-Lima-Lima',
              style: TextStyle( fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow:  TextOverflow.ellipsis,
            ),
            Text(
              'Los Olivos / Lima / Lima',
              style: TextStyle( fontSize: 15, color: Colors.black),
              maxLines: 1,
              overflow:  TextOverflow.ellipsis,
            ),
            Text(
              '24f20190658702-24f20190658',
              style: TextStyle( fontSize: 15, color: Colors.black),
              maxLines: 2,
              overflow:  TextOverflow.ellipsis,
            ),
            Text(
              '702-24F20190658702',
              style: TextStyle( fontSize: 15, color: Colors.black),
              maxLines: 2,
              overflow:  TextOverflow.ellipsis,
            ),
            
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    //color: Colors.black,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25),
      topRight: Radius.circular(25)
    )
  );
}

class _StatusStack extends StatelessWidget {

  final int status;
  _StatusStack( this.status );
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: ( this.status == 1 )
        ? Icon( Icons.check_circle, size: 50, color: Colors.green)
        : Icon( Icons.circle, size: 50, color: Colors.red),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:pitscurier/widgets/taskcard_wgt.dart';


class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/detalle');
          },
          child: TaskCard(),
        ),
      )
   );
  }
}

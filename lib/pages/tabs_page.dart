import 'package:flutter/material.dart';
import 'package:pitscurier/pages/tab1_page.dart';
import 'package:pitscurier/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegationMoldes(),

      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegation(),
      ),
    );
  }
}

class _Navegation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationMoldes>(context); 

    return BottomNavigationBar(
      currentIndex: navegationModel._paginaActual,
      onTap: (index)=> navegationModel.setPaginaActual = index,
      items: [
        BottomNavigationBarItem(icon: Icon( Icons.delivery_dining_sharp ), label: 'Entregas'),
        BottomNavigationBarItem(icon: Icon( Icons.house ), label: 'Recojos'),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navegationModel = Provider.of<_NavegationMoldes>(context);

    return PageView(
      controller: navegationModel.getPageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page()
      ],
      
    );
  }
}

class _NavegationMoldes with ChangeNotifier{

  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get getPaginaActual => this._paginaActual;

  set setPaginaActual( int valor ){
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(microseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
  PageController get getPageController => this._pageController;

}




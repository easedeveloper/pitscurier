import 'package:flutter/material.dart';
import 'package:pitscurier/pages/tabs_page.dart';
import 'package:pitscurier/search/task_delegate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Andrei Salas'),
        backgroundColor: Colors.orange[300],
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () => 
              showSearch(
                context: context,
                delegate: TaskDelegate()
              ),
          )
        ],
        leading:IconButton(
          icon: Icon( Icons.exit_to_app ),
          tooltip: 'Regresar al Login',
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
        ),
      ),
      body: TabsPage(),
   );
  }
}
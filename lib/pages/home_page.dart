import 'package:flutter/material.dart';
import 'package:youtube_app/pages/biblioteca_page.dart';
import 'package:youtube_app/pages/notificaciones_page.dart';
import 'package:youtube_app/pages/principal_page.dart';
import 'package:youtube_app/pages/suscripciones_page.dart';
import 'package:youtube_app/pages/tendencias_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('assets/images/logo-youtube.png',width: 100,),
          actions: [
            IconButton(icon: Icon(Icons.videocam, color: Colors.grey),onPressed: (){}),
            IconButton(icon: Icon(Icons.search, color: Colors.grey),onPressed: (){}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.0,horizontal: 5.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user-image.png'),
                radius: 15.0,
              ),
            )
          ],
        ),
        body: TabBarView(
          children: [
            PrincipalPage(),
            TendenciasPage(),
            SuscripcionesPage(),
            NotificacionesPage(),
            BibliotecaPage()
          ]
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            labelStyle: TextStyle(fontSize: 10),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.red,
            indicatorColor: Colors.red,
            labelPadding: EdgeInsets.all(2.0),
            tabs: [
              Tab(icon: Icon(Icons.home),text: 'Principal'),
              Tab(icon: Icon(Icons.whatshot),text: 'Tendencias'),
              Tab(icon: Icon(Icons.subscriptions),text:'Suscripciones'),
              Tab(icon: Icon(Icons.notifications),text: 'Notificaciones'),
              Tab(icon: Icon(Icons.folder),text: ('Biblioteca')),
            ],
          ),
        ),
      ),
    );
  }

}

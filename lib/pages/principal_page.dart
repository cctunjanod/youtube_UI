import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtube_app/pages/video_detalles_page.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

enum opciones {noInteresa, guardarMasTarde, guardarLista, compartir, denunciar}

class _PrincipalPageState extends State<PrincipalPage> {

  @override
  void initState() {
    _obtenerElementos();
  }

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool like = false;
  bool dislike = false;
  Color _colorActivo = Colors.red;
  Color _colorDefecto = Colors.grey;
  bool _mostrarSwitch = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearLista(),
          _switch(),
        ],
      )
    );
  }

  _crearLista(){
    return RefreshIndicator(
      onRefresh: _obtenerElementos,
      child: ListView.builder(
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return Card(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _mostrarSwitch = true;
                    });
                  },
                  child: Container(
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/loading.gif'),
                      image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 10.0, bottom: 40.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/user-image.png'),
                            radius: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width -100,
                        child: Column(
                          children: [
                            Wrap(children: [Text('Nombre descriptivo del Video Nº$index',style: TextStyle(fontSize: 19)),],),
                            SizedBox(height: 5.0),
                            Text('Username · 213$index vistas · hace $index horas',style: TextStyle(color: Colors.grey[600],fontSize: 14),)
                          ],
                        ),
                      ),
                      Container(height: 30,width: 22,child: _crearPopupMenu(),)
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: Icon(Icons.thumb_up),color: like ? _colorActivo : _colorDefecto,onPressed:  (){
                        setState(() {
                          like = true;
                          dislike = false;
                        });
                      },),
                      IconButton(icon: Icon(Icons.thumb_down),color: dislike ? _colorActivo : _colorDefecto,onPressed: (){
                        setState(() {
                          dislike = true;
                          like = false;
                        });
                      },)
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }

  Future<Null> _obtenerElementos() async {
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, (){
      _listaNumeros.clear();
      _agregarElementos();
    });
  }

  _agregarElementos(){
    for(var i = 1; i < 10; i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Widget _crearPopupMenu(){
    return PopupMenuButton<opciones>(
        padding: EdgeInsets.all(0),
        onSelected: (opciones res) {
          setState(() {
            if ('opciones.noInteresa' == res.toString()) {

            }
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<opciones>>[
          PopupMenuItem<opciones>(
              value: opciones.noInteresa,
              child: Text('No me interesa')
          ),
          PopupMenuItem<opciones>(
              value: opciones.guardarMasTarde,
              child: Text('Guardar en Ver más tarde')
          ),
          PopupMenuItem<opciones>(
              value: opciones.guardarLista,
              child: Text('Guardar en una lista de reproducción')
          ),
          PopupMenuItem<opciones>(
              value: opciones.compartir,
              child: Text('Compartir')
          ),
          PopupMenuItem<opciones>(
              value: opciones.denunciar,
              child: Text('Denunciar')
          )
        ]
    );
  }

  _switch(){
    if(_mostrarSwitch){
      return LayoutBuilder(builder: (BuildContext, BoxConstraints) => VideoDetalles());
    }else{
      return SizedBox(width: 0,height: 0,);
    }
  }


}

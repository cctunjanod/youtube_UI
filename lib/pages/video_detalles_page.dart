import 'package:flutter/material.dart';
import 'package:youtube_app/pages/home_page.dart';

class VideoDetalles extends StatefulWidget {
  @override
  _VideoDetallesState createState() => _VideoDetallesState();
}

class _VideoDetallesState extends State<VideoDetalles> {

  bool _event = false;
  bool _close = false;

  bool like = false;
  bool dislike = false;
  Color _colorActivo = Colors.red;
  Color _colorDefecto = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0,end: 1.0),
      duration: Duration(milliseconds: 500),
      builder: (context,value,child){
        return Opacity(
          opacity: value,
          child: child,
        );
    },
      child: GestureDetector(
        onVerticalDragEnd: (DragDownDetails){
          setState(() {
            if(_event){
              _event = false;
            }else{
              _event = true;
            }
          });
        },
        child: _switchContent(),
      ),
    );
  }

  _detalles(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=0'),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Wrap(children: [Text('Nombre descriptivo del Video',style: TextStyle(fontSize: 19)),],),
                    IconButton(padding: EdgeInsets.only(left: 50),icon: Icon(Icons.arrow_drop_down,color: Colors.grey[700],), onPressed: (){})
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:10.0),
                      child: Text('23.098 vistas',style: TextStyle(color: Colors.grey,fontSize: 12),),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(icon: Icon(Icons.thumb_up,color: like ? _colorActivo : _colorDefecto), onPressed: (){
                      setState(() {
                        like = true;
                        dislike = false;
                      });
                    }),
                    IconButton(icon: Icon(Icons.thumb_down,color: dislike ? _colorActivo : _colorDefecto), onPressed: (){
                      setState(() {
                        dislike = true;
                        like = false;
                      });
                    }),
                    IconButton(padding: EdgeInsets.all(0),icon: Icon(Icons.reply),color: Colors.grey, onPressed: (){}),
                    Container(padding: EdgeInsets.all(0),width: 30,height: 30,decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)
                    ),child: Center(child: IconButton(padding: EdgeInsets.all(0),icon: Icon(Icons.file_download,color: Colors.white,), onPressed: (){}))),
                    IconButton(icon: Icon(Icons.playlist_add,color: Colors.grey), onPressed: (){}),
                  ],
                ),
                Divider(),
                Row(
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
                      width: MediaQuery.of(context).size.width -190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(children: [Text('Nombre descriptivo del Video',style: TextStyle(fontSize: 19)),],),
                          SizedBox(height: 5.0),
                          Text('57.650 suscripciones',style: TextStyle(color: Colors.grey[600],fontSize: 10),)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 10,),
                        Text('SUSCRITO',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                        IconButton(padding: EdgeInsets.only(left: 10),icon: Icon(Icons.notifications_none,color: Colors.grey,), onPressed: (){})
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _miniBar(){
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.63,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            color: Colors.white,
            width: MediaQuery.of(context).size.width - 10,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInImage(
                  placeholder: AssetImage('assets/images/loading.gif'),
                  image: NetworkImage('https://picsum.photos/130/70/?image=0'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width -230,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Nombre descriptivo del Video',style: TextStyle(color: Colors.black,fontSize: 13),overflow: TextOverflow.ellipsis),
                      Text('Max Diaz',style: TextStyle(color: Colors.grey[600],fontSize: 10),)
                    ],
                  ),
                ),
                Container(width: 30,child: IconButton(padding: EdgeInsets.all(0),color: Colors.grey[600],icon: Icon(Icons.play_arrow), onPressed: (){})),
                Container(margin: EdgeInsets.only(right: 6.0),width: 30,child: IconButton(padding: EdgeInsets.all(0),color: Colors.grey[600],icon: Icon(Icons.close), onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()
                    ),
                  );
                }))
              ],
            ),

          ),
        ),
      ],
    );
  }

  _switchContent(){
    if(!_event){
      return _detalles();
    }else{
      return _miniBar();
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listNumber = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() { 
    super.initState();
    _agregar();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        fetchData();
      }
    });
  }

  @override
  void dispose() { 
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Listas"),
       ),
       body: Stack(
          children: <Widget>[
            _crearLista(),
            _crearLoading(),
          ], 
       )
    );
  }


  Widget _crearLista(){
    return RefreshIndicator(
          onRefresh: obtenerPagina1,
          child: ListView.builder(
            controller: _scrollController,
            itemCount:_listNumber.length,
            itemBuilder:(BuildContext context , int index){
              final imagen = _listNumber[index];
              return FadeInImage(
                image: NetworkImage('https://picsum.photos/id/793/500/300/?image=$imagen'),
                placeholder: AssetImage('assets/jar-loading.gif'),
              );
            },
          ),
        );
  }

  Future<Null> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listNumber.clear();
      _ultimoItem++;
      _agregar();
    });

    return Future.delayed(duration);
  }


 void _agregar(){
   for(var i=0; i<10; i++){
     _ultimoItem++;
     _listNumber.add(_ultimoItem);
   }
   setState(() {
     
   });
 }

 Future fetchData() async{
   _isLoading = true;
   setState(() {
     
   });
  final duration = Duration(seconds: 2);
  return new Timer(duration, respuestaHttpp);
 }

 void respuestaHttpp(){
      _isLoading = false;
      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: Duration(
          milliseconds: 250
        )
      );
      _agregar();
 }

   Widget _crearLoading(){
    if (_isLoading ){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    }else{
      return Container();
    }
  }

}
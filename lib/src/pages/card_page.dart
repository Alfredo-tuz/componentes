import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
      padding: EdgeInsets.all(20),
      //padding: EdgeInsets.symmetric(horizontal: 10.0),
      children: <Widget>[
        _cardTipo1(),
        SizedBox(height: 40.0),
        _cardTipo2()
      ],
      ),
    );
  }
          
    Widget _cardTipo1() {
      return Card(
        elevation: 14.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_album, color:Colors.blue),
              title: Text('Soy el titulo de esta tarjeta'),
              subtitle: Text('Aqui estamos con la descripción de ad lorem lorem lorem radaidasd adsakd ja dsadj aodj ajd akjd akdj akjd akdj adj asdkj adj asdj akdj '),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: (){

                  },
                ),
                FlatButton(
                  child: Text('OK'),
                  onPressed: (){

                  },
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget _cardTipo2() {
      final card =  Container(
        // clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            FadeInImage(
             image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWyKHfjXNbpKFZDgdviaWUAbZdnFl6HcVEcE8MTLlS_22_XBj9'),
             placeholder:AssetImage('assets/jar-loading.gif') ,
             fadeInDuration: Duration(milliseconds: 200),
             height: 300.0,
             fit: BoxFit.cover,
            ),


            //Image(
             // image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWyKHfjXNbpKFZDgdviaWUAbZdnFl6HcVEcE8MTLlS_22_XBj9'),
            //),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('No tenoda jadasdj ')
            )
          ],
        ),
      );
      return Container(
        child:ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: card,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0,10.9)
            )
          ],
          color: Colors.white
        ),
      );
    }
}
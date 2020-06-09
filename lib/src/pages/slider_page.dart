import 'package:flutter/material.dart';
class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.00;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Slider'),
       ),
       body: Container(
         padding: EdgeInsets.only(top:50.0),
         child: Column(
           children: <Widget>[
             _crearSlider(),
             _checkBox(),
             _crearSwitch(),
             Expanded(
               child:_crearImagen()
             )
           ],
         )
       ),
    );
  }

  Widget _crearSwitch(){
    return SwitchListTile(
          title: Text('Bloquear slider'),
          value: _bloquearCheck,
          onChanged: (valor){
            setState(() {
              _bloquearCheck = valor;
            });
          },
        );
  }

  Widget _checkBox(){
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor){
    //     setState(() {
    //       _bloquearCheck = valor;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged:(_bloquearCheck) ? null : (dValor){
        setState(() {
          _valorSlider = dValor;
        });
      },
    );
  }

  Widget _crearImagen(){
    return Image(
      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwpbGvLwdsxPF7YnkFoPT_z7OcqNLAyqQq3ypYJkUJlLL0fRGE'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
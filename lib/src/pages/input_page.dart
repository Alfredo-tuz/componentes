import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre= '';
  String _email= '';
  String date = '';
  String _opcionSelected = 'Volar';
  List<String> _poderes = ['Volar','Rayos X','Super aliento'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Inputs de texto'),
       ),
       body: ListView(
         children: <Widget>[
           _crearInput(),
           Divider(),
           _crearEmail(),
           Divider(),
           _crearPassword(),
           Divider(),
           _crearFecha(context),
           Divider(),
           _crearDropdown(),
           Divider(),
           _crearPersona(),
         ],
       ),
    );
  }

  Widget _crearInput() {
    return TextField(
       //autofocus: true,
       textCapitalization: TextCapitalization.sentences,
       decoration: InputDecoration(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20.0)
         ),
         counter: Text('Letras ${_nombre.length}'),
         hintText: 'Nombre de la persona',
         labelText: 'Nombre',
         helperText: 'Sólo es el nombre',
         suffixIcon: Icon(Icons.accessibility),
         icon: Icon(Icons.account_circle)
       ),
       onChanged: (valor){
         setState(() {
           _nombre=valor;
         });
       },
    );
  }


  Widget _crearPersona(){
    return ListTile(
      title: Text('Nombre es : $_nombre'),
      subtitle: Text('Emails es :$_email'),
      trailing: Text(_opcionSelected),
    );
  }

  Widget _crearEmail(){
    return TextField(
       keyboardType: TextInputType.emailAddress,
       decoration: InputDecoration(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20.0)
         ),
         hintText: 'Email de la persona',
         labelText: 'email',
         suffixIcon: Icon(Icons.alternate_email),
         icon: Icon(Icons.email)
       ),
       onChanged: (valor)=>setState(() {  _email=valor;})
       ,
    ); 
  }

  Widget _crearPassword(){
    return TextField(
       obscureText: true,
       decoration: InputDecoration(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20.0)
         ),
         hintText: 'password de la persona',
         labelText: 'password',
         suffixIcon: Icon(Icons.lock_open),
         icon: Icon(Icons.lock)
       ),
       onChanged: (valor)=>setState(() {  _email=valor;})
       ,
    ); 
  }

  Widget _crearFecha(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
       decoration: InputDecoration(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20.0)
         ),
         hintText: 'Fecha de nacimiento',
         labelText: 'fecha',
         suffixIcon: Icon(Icons.calendar_today),
         icon: Icon(Icons.calendar_today)
       ),
       onTap: (){
         FocusScope.of(context).requestFocus(new FocusNode());
         _selectDate(context);
       },
    );
  }

  _selectDate(BuildContext context) async{
    DateTime picker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES')  
    );
    if(picker != null){
      setState(() {
        date= picker.toString();
        _inputFieldDateController.text = date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    

    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }



  Widget _crearDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSelected,
            items: getOpcionesDropdown(),
            onChanged: (opt){
              setState(() {
                _opcionSelected = opt;
              });
            },
          ),
        )
      ],
    );
  }
}
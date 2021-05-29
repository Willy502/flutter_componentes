import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _inputFieldDateController = new TextEditingController();
  String _opcionSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropDown()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Nombre',
        labelText: 'Nombre de usuario',
        helperText: 'Ingresa tu nombre',
        icon: Icon(Icons.account_circle),
        suffixIcon: Icon(Icons.accessibility)
      ),
    );
  }

  Widget _createEmail() {
    return TextField(
      //autofocus: true,
      keyboardType: TextInputType.emailAddress, // Cambio de teclado
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Correo',
        labelText: 'Correo electrónico',
        helperText: 'example@example.com',
        prefixIcon: Icon(Icons.email)
      ),
    );
  }

  Widget _createPassword() {
    return TextField(
      //autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Contraseña',
        labelText: 'Ingresa tu contraseña',
        prefixIcon: Icon(Icons.lock)
      ),
      onChanged: (value) {
        RegExp exp = RegExp("");
        if (exp.hasMatch(value)) {

        } else {

        }
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      //autofocus: true,
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Fecha',
        labelText: 'Fecha de cumpleaños',
        prefixIcon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate();
      },
    );
  }

  // Date picker
  _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      String formatDate = DateFormat('dd/MM/yyyy').format(picked);
      String date = formatDate;
      _inputFieldDateController.text = date;
    }
  }

  List<DropdownMenuItem<String>> getOptions() {
    List<DropdownMenuItem<String>> opciones = [];
    opciones.add(DropdownMenuItem(child: Text('Auto'), value: '1'));
    opciones.add(DropdownMenuItem(child: Text('Moto'), value: '2'));
    return opciones;
  }

  _createDropDown() {
    return Row(
      children: [
        Icon(Icons.playlist_add_check),
        SizedBox(width: 30.0),
        DropdownButton(
          hint: Text('Selecciona una opcion'),
          value: _opcionSeleccionada,
          items: getOptions(),
          onChanged: (option) {
            _opcionSeleccionada = option;
            setState(() {});
          },
        ),
      ],
    );
  }
}
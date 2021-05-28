import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  final ButtonStyle mainButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder())
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAlert(context),
          child: Text('Mostrar Alerta'),
          style: mainButtonStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text('Alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Soy el contenido'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar')
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar')
            )
          ],
        );
      }
    );
  }

}
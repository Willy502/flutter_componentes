import 'package:flutter/material.dart';

import 'package:componentes_app/src/pages/alert_page.dart';
import 'package:componentes_app/src/routes/routes.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'homePage',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) {
        print('RUTA FALLO: ${settings.name}');
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
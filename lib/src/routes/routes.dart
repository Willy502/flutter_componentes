import 'package:flutter/material.dart';
import 'package:componentes_app/src/pages/home_page.dart';
import 'package:componentes_app/src/pages/alert_page.dart';
import 'package:componentes_app/src/pages/avatar_page.dart';
import 'package:componentes_app/src/pages/card_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    'homePage' : (BuildContext context) => HomePage(),
    'alert' : (context) => AlertPage(),
    'avatar' : (context) => AvatarPage(),
    'card' : (context) => CardPage()
  };
}
import 'package:flutter/material.dart';
import 'package:componentes_app/src/pages/home_page.dart';
import 'package:componentes_app/src/pages/alert_page.dart';
import 'package:componentes_app/src/pages/avatar_page.dart';
import 'package:componentes_app/src/pages/card_page.dart';
import 'package:componentes_app/src/pages/animated_page.dart';
import 'package:componentes_app/src/pages/input_page.dart';
import 'package:componentes_app/src/pages/slider_page.dart';
import 'package:componentes_app/src/pages/listview_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    'homePage' : (BuildContext context) => HomePage(),
    'alert' : (context) => AlertPage(),
    'avatar' : (context) => AvatarPage(),
    'card' : (context) => CardPage(),
    'animatedContainer' : (context) => AnimatedPage(),
    'inputs' : (context) => InputPage(),
    'slider' : (context) => SliderPage(),
    'list' : (context) =>ListViewPage()
  };
}
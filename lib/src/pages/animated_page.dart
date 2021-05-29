import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadus = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Page'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadus,
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeForm,
        child: Icon(Icons.play_arrow),
        ),
    );
  }

  void _changeForm() {

    final random = Random();
    int colorRed = random.nextInt(255);
    int colorGreen = random.nextInt(255);
    int colorBlue = random.nextInt(255);
    double border = random.nextInt(100).toDouble();

    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();
    _color = Color.fromRGBO(colorRed, colorGreen, colorBlue, 1);
    _borderRadus = BorderRadius.circular(border);
    setState(() {});
  }
}
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderPosition = 10;
  bool _blocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        child: Column(
          children: [
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            _createImage()
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      //divisions: 4,
      min: 0.0,
      max: 300.0,
      value: _sliderPosition,
      onChanged: (_blocked) ? null : (value) {
        _sliderPosition = value;
        setState(() {});
      },
    );
  }

  Widget _createCheckBox() {
    /*return Checkbox(
      value: _blocked,
      onChanged: (value) {
        setState(() {
          _blocked = value;
        });
      }
    );
  }*/

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _blocked,
      onChanged: (value) {
        setState(() {
          _blocked = value;
        });
      }
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _blocked,
      onChanged: (value) {
        setState(() {
          _blocked = value;
        });
      }
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://toppng.com/uploads/preview/the-amazing-spiderman-vector-logo-free-11574024417b74mq4o9oh.png'),
      width: _sliderPosition,
      fit: BoxFit.contain,
    );
  }
}
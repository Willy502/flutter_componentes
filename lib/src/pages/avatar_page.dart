import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: _appBarIcons(),
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/original.gif'),
          image: NetworkImage('https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }

  List<Widget> _appBarIcons() {
    return [
      Container(
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
          radius: 25.0,
        ),
      ),
      Container(
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          child: Text('AB'),
          backgroundColor: Colors.lightGreen,
        ),
      )
    ];
  }
}
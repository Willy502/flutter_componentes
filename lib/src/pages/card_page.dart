import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2()
        ],
      ),
    );
  }

  Card _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          ListTile(
            title: Text('Soy el titulo'),
            leading: Icon(Icons.photo_album, color: Colors.blue),
            subtitle: Text('Soy el subtitulo'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: null, child: Text('Cancelar')),
              TextButton(onPressed: () {}, child: Text('Aceptar'))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {

     final card = Container(
       child: Column(
         children: [
           FadeInImage(
             placeholder: AssetImage('assets/original.gif'),
             image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/3/35/Neckertal_20150527-6384.jpg'),
             fadeInDuration: Duration(milliseconds: 200),
             fit: BoxFit.cover,
           ),
           Container(
             padding: EdgeInsets.all(10.0),
             child: Text('Soy el texto de esta tarjeta'),
           )
         ],
       ),
     );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:componentes_app/src/providers/menu_provider.dart';
import 'package:componentes_app/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

  Widget _list() {

    return FutureBuilder(
      future: MenuProvider().loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
    
    /*List<Widget> listado = [];
    final data = MenuProvider().loadData().then((value) {
      
      for (Map opcion in value) {
        print(opcion);
        listado.add(
          ListTile(
            title: Text(opcion['texto']),
          )
        );
      }
      print("TERMINE");

    });
    print("LISTVIEw");

    return ListView(
      children: listado,
    ); */
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {

    final List<Widget> widgets = [];
    if (data == null) return [];

    data.forEach((opcion) {
      final widgetTemp = ListTile(
        title: Text(opcion['texto']),
        leading: getIcon(opcion['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, opcion['ruta']);
        },
      );

      widgets..add(widgetTemp)..add(Divider());
    });

    return widgets;

  }
}
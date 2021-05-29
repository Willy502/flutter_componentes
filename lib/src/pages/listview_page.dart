import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  bool _isLoading = false;
  List<int> _listaNumeros = [];
  int _lastItem = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _add10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
          fetchData();
        }
    });
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: Stack(
        children: [
          _createList(),
          _createLoading()
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int position) {
          final imagen = _listaNumeros[position];
          return FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen')
          );
        }
        ),
      onRefresh: onRefreshInidcator
    );
  }

  void _add10() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _listaNumeros.add(_lastItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    return Timer(duration, respuestaHttp);

  }

  void respuestaHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
    duration: Duration(milliseconds: 250),
    curve: Curves.fastOutSlowIn);
    _add10();
  }

  Widget _createLoading() {
    if(_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 16.0)
        ],
      );
    } else {
      return Container();
    }
    
  }

  Future<Null> onRefreshInidcator() async {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      //_lastItem = 0;
      _add10();
    });
    return Future.delayed(duration);
  }
}
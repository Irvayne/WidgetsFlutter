
import 'package:flutter/material.dart';

class PageListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body(){
    return ListView(
      itemExtent: 500,
      children: <Widget>[
        _img("asserts/images/irvayne.jpeg"),
        _img("asserts/images/irvayne.jpeg"),
        _img("asserts/images/irvayne.jpeg"),
      ],
    );
  }

  _img(String img){
    return Image.asset(img,
    fit: BoxFit.cover,
    );
  }
}

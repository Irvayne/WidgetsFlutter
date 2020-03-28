

import 'package:flutter/material.dart';

import 'page_listview.dart';

class DogPage extends StatelessWidget {
  @override

  final Dog dog;

  DogPage(this.dog);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
      ),
      body: Image.asset(dog.foto),
    );
  }
}

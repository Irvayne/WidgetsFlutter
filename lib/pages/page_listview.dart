
import 'package:flutter/material.dart';

class Dog{
  String nome;
  String foto;
  
  Dog(this.nome, this.foto);
}

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

    List<Dog> dogs = [
      Dog("Irva1", "asserts/images/irvayne.jpeg"),
      Dog("Irva2", "asserts/images/irvayne.jpeg"),
      Dog("Irva3", "asserts/images/irvayne.jpeg"),
    ];

    return ListView.builder(
      itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index){
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
          _img(dogs[index].foto ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  dogs[index].nome,
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              )

            ],
          );


    });
  }

  _img(String img){
    return Image.asset(img,
    fit: BoxFit.cover,
    );
  }
}

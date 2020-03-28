
import 'package:aula01/pages/dog_page.dart';
import 'package:aula01/utils/nav.dart';
import 'package:flutter/material.dart';

class Dog{
  String nome;
  String foto;
  
  Dog(this.nome, this.foto);
}

class PageListView extends StatefulWidget {

  @override
  _PageListViewState createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: (){
              print("Lista");
              setState(() {
                _gridView = false;
              });

            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: (){
              print("grid");
              setState(() {
                _gridView = true;
              });
            },
          )
        ],
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
      Dog("Irva4", "asserts/images/irvayne.jpeg"),
      Dog("Irva5", "asserts/images/irvayne.jpeg"),
      Dog("Irva6", "asserts/images/irvayne.jpeg"),
      Dog("Irva7", "asserts/images/irvayne.jpeg"),
      Dog("Irva8", "asserts/images/irvayne.jpeg"),
      Dog("Irva9", "asserts/images/irvayne.jpeg"),
    ];

    if(_gridView){
      return GridView.builder(
          itemCount: dogs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index){
            return listView(dogs, index);


          });
    }else{
      return ListView.builder(
          itemCount: dogs.length,
          itemExtent: 350,
          itemBuilder: (context, index){
            return listView(dogs, index);


          });
    }

  }

  listView(List<Dog> dogs, int index) {
    return GestureDetector(
      onTap: (){
        push(context, DogPage(dogs[index]));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
      _img(dogs[index].foto ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(16)
              ),
                child: Text(
                  dogs[index].nome,
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
            )
          )

        ],
      ),
    );
  }

  _img(String img){
    return Image.asset(img,
    fit: BoxFit.cover,
    );
  }
}

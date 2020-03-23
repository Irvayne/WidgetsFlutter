

import 'package:aula01/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
        centerTitle: true,
      ),
      body: _button(context),
    );
  }

  _button(context){
    return Center(
      child: BlueButton("voltar", onPressed:() => _onClickVoltar(context)),
    );
  }

  _onClickVoltar(context){
    Navigator.pop(context, "Tela 3");
  }
}

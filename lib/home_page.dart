import 'package:aula01/pages/hello_page1.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/pages/page_listview.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello word"),
        centerTitle: true,
      ),
      body: _body(context)
    );
  }

  _body(BuildContext context){
    return  Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),

        ],
      ),
    
    );
  }

  Container _pageView() {
    return Container(
          margin: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
          height: 400,
          child: PageView(
            children: <Widget>[
              _img("asserts/images/irvayne.jpeg"),
              _img("asserts/images/irvayne.jpeg"),
              _img("asserts/images/irvayne.jpeg"),
            ],
          ),
        );
  }

  _buttons(BuildContext context){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("ListView", onPressed: () => _onClickNavigator(context, PageListView())),
            BlueButton("Page 2", onPressed: () => _onClickNavigator(context, HelloPage2())),
            BlueButton("Page 3", onPressed: () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("Snack", onPressed: _onClickSnack),
            BlueButton("Dialog", onPressed: _onClickDialog),
            BlueButton("Toast", onPressed: _onClickToast),
          ],
        )
      ],
    );
  }

   _onClickNavigator(BuildContext context, Widget page) async {
    String retorno = await push(context, page);
    print(">>> $retorno");
  }

  _img(String img){
    return Image.asset(img);
  }
  _text(){
    return Text("Hello word",
        style: TextStyle(
            fontSize: 30,
            color: Colors.red
        ));
  }

  _onClickSnack() {
    
  }

  _onClickDialog() {
  }

  _onClickToast() {
  }
}
import 'package:aula01/pages/drawer_list.dart';
import 'package:aula01/pages/hello_page1.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/pages/page_listview.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello word"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Tab 1",),
              Tab(text: "Tab 2",),
              Tab(text: "Tab 3",)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow
            )
          ],
        ),


        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed:() {
                _onClickFab();
              },

            ),

          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFab(){
    print("add");
  }

  _body(BuildContext context){
    return  Container(
      padding: EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),

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

  _buttons(){
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView", onPressed: () =>
                    _onClickNavigator(context, PageListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            //Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //children: <Widget>[
               // BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                //BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                //BlueButton("Toast", onPressed: _onClickToast),
              //],
           // )
          ],
        );
      }
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

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("olá flutter"),
        action: SnackBarAction(
          textColor: Colors.yellow,
          label: "ok",
          onPressed: () {
            print("ok");
          },
        ),
      )
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context){
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Flutter é mt legal"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Aceitar"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é fd",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
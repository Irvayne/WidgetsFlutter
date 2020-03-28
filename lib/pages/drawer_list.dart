
import 'package:flutter/material.dart';


class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Irvayne"),
              accountEmail: Text("irvayne@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("asserts/images/irvayne.jpeg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Inicio"),
              subtitle: Text("Opcao para inicio"),
              trailing: Icon(Icons.arrow_back),
              onTap: (){
                print("novo");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Opcao para ajuda"),
              trailing: Icon(Icons.arrow_back),
              onTap: (){
                print("novo");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              trailing: Icon(Icons.arrow_back),
              onTap: (){
                print("novo");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

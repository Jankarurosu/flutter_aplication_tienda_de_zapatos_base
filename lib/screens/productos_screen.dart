import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/widgets/menu_lateral.dart';

class ProductosScreen extends StatefulWidget {
  @override
  createState() => _ProductosScreen();
}

class _ProductosScreen extends State<ProductosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView(
          children: [
            /*
            Container(
              height: 100,
              color: Colors.red,
            ),
            Container(
              height: 100,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              color: Colors.green,
            ),
            Container(
              height: 100,
              color: Colors.grey,
            ),*/
            /*ListTile(
              title: Text("LAPTOP MACBOOK PRO"),
              tileColor: Colors.red,
            ),
            ListTile(
              title: Text("TECLADO"),
              tileColor: Colors.blue,
            ),
            ListTile(
              title: Text("MOUSE"),
              tileColor: Colors.green[50],
            ),*/
            Card(
              child: Column(children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.card_giftcard),
                  title: Text(
                    "LAPTOP LENOVO",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  subtitle: Text(
                    "S/. 1,500",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ),
              ]),
            ),
            Card(
              child: Column(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.card_giftcard),
                    title: Text(
                      "TECLADO GAMER",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    subtitle: Text(
                      "S/. 100",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //Boton que te dirige a otro lado
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "ruta_productos_form");
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}

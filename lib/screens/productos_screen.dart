import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/models/producto.dart';
import 'package:flutter_application_clase1_actividad2/providers/producto_provider.dart';
import 'package:flutter_application_clase1_actividad2/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

class ProductosScreen extends StatefulWidget {
  @override
  createState() => _ProductosScreen();
}

class _ProductosScreen extends State<ProductosScreen> {
  @override
  Widget build(BuildContext context) {
    //Llamamos al proveedor y la lista
    final productoProvider = Provider.of<ProductoProvider>(context);
    final List<Producto> listaProductos = productoProvider.listaProductos;

    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView.builder(
          itemCount: listaProductos.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      listaProductos[index].descripcion,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      "S/." + listaProductos[index].precio.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    leading: Icon(Icons.card_giftcard),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      //Boton que te dirige a Productos Form
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "ruta_productos_form");
        },
        backgroundColor: Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/models/proveedores.dart';
import 'package:flutter_application_clase1_actividad2/providers/proveedores_provider.dart';
import 'package:flutter_application_clase1_actividad2/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

class ProveedoreScreen extends StatefulWidget {
  @override
  createState() => _ProveedoreScreen();
}

class _ProveedoreScreen extends State<ProveedoreScreen> {
  @override
  Widget build(BuildContext context) {
    //Llamamos al proveedor y la lista
    final proveedoresProvider = Provider.of<ProveedoresProvider>(context);
    final List<Proveedore> listaProveedores =
        proveedoresProvider.listaProveedores;

    return Scaffold(
      appBar: AppBar(
        title: Text("Proveedores"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView.builder(
          itemCount: listaProveedores.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                      title: Text(
                        listaProveedores[index].descripcion,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text(
                        listaProveedores[index].aporte,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      leading: Icon(Icons.apps)),
                ],
              ),
            );
          },
        ),
      ),
      //Boton que te dirige a Proveedores Form
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "ruta_proveedores_form");
        },
        backgroundColor: Colors.black,
      ),
    );
  }
}

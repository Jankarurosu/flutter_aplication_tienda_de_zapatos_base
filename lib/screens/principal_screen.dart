import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/models/producto.dart';
import 'package:flutter_application_clase1_actividad2/providers/producto_provider.dart';
import 'package:flutter_application_clase1_actividad2/screens/producto_detail.dart';
import 'package:flutter_application_clase1_actividad2/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  createState() => _PrincipalScreen();
}

class _PrincipalScreen extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    //Llamamos al proveedor y la lista
    final productoProvider = Provider.of<ProductoProvider>(context);
    final List<Producto> listaProductos = productoProvider.listaProductos;

    return Scaffold(
      appBar: AppBar(
        title: Text("Nuestros mejores productos"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: const MenuLateral(),
      body: Container(
        child: ListView.builder(
          itemCount: listaProductos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {
                //Te lleva a la pagina de detalles del producto
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductoDetail(producto: listaProductos[index]);
                }))
              },
              child: Card(
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
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/models/producto.dart';
import 'package:flutter_application_clase1_actividad2/providers/producto_provider.dart';
import 'package:provider/provider.dart';

class ProductoFormScreen extends StatefulWidget {
  const ProductoFormScreen({Key? key}) : super(key: key);

  @override
  State<ProductoFormScreen> createState() => _ProductoFormScreen();
}

class _ProductoFormScreen extends State<ProductoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final txtDescripcion = TextEditingController();
    final txtPrecio = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de nuevos productos"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                //maxLines: 8,
                //maxLength: 50,
                decoration: InputDecoration(
                  labelText: "Descripcion",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: txtDescripcion,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese una descripcion";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Precio",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: txtPrecio,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese un precio";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                  child: const Text("GUARDAR"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Validando...")));

                      var producto = Producto(
                          id: '',
                          productoId: 0,
                          descripcion: txtDescripcion.text,
                          precio: int.parse(txtPrecio.text));

                      productoProvider.saveProducto(producto);

                      Navigator.pushReplacementNamed(context, "ruta_productos");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

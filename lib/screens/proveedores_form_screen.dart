import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/models/proveedores.dart';
import 'package:flutter_application_clase1_actividad2/providers/proveedores_provider.dart';
import 'package:provider/provider.dart';

class ProveedoresFormScreen extends StatefulWidget {
  const ProveedoresFormScreen({Key? key}) : super(key: key);

  @override
  State<ProveedoresFormScreen> createState() => _ProveedoresFormScreen();
}

//checkbox y matchbox
enum Categorias { computo, sonido }

class _ProveedoresFormScreen extends State<ProveedoresFormScreen> {
  final _formKey = GlobalKey<FormState>();
  Categorias? _catSeleccion = Categorias.computo;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final proveedoresProvider = Provider.of<ProveedoresProvider>(context);
    final txtDescripcion = TextEditingController();
    final txtAporte = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de nuevos proveedores"),
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
                  hintText: 'Ingrese el nombre del proveedor',
                  labelText: "Proveedor",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: txtDescripcion,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese un proveedor";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ingrese el aporte del proveedor',
                  labelText: "Aporte",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: txtAporte,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese un aporte";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                  child: const Text("SUBIR"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Subiendo...")));

                      var proveedores = Proveedore(
                          id: '',
                          proveedoresId: 0,
                          descripcion: txtDescripcion.text,
                          aporte: txtAporte.text);

                      proveedoresProvider.saveProveedores(proveedores);

                      Navigator.pushReplacementNamed(
                          context, "ruta_proveedores");
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

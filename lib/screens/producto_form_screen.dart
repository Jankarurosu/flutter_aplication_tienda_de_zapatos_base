import 'package:flutter/material.dart';

class ProductoFormScreen extends StatefulWidget {
  const ProductoFormScreen({Key? key}) : super(key: key);

  @override
  State<ProductoFormScreen> createState() => _ProductoFormScreen();
}

//checkbox y matchbox
enum Categorias { computo, sonido }

class _ProductoFormScreen extends State<ProductoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  Categorias? _catSeleccion = Categorias.computo;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final txtDescripcion = TextEditingController();
    final txtPrecio = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTRO DE PRODUCTOS"),
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
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text("Categoria"),
                  SizedBox(
                    height: 20,
                  ),
                  Radio(
                    value: Categorias.computo,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                      });
                    },
                  ),
                  Text("Computo"),
                  SizedBox(
                    height: 15,
                  ),
                  Radio(
                    value: Categorias.sonido,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                      });
                    },
                  ),
                  Text("Sonido")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text("Estado"),
                  SizedBox(
                    height: 20,
                  ),
                  Checkbox(
                      value: _estadoActivo,
                      onChanged: (value) {
                        setState(() {
                          _estadoActivo = value;
                          print("_estadoActivo: ${_estadoActivo}");
                        });
                      }),
                ],
              ),
              Container(
                child: ElevatedButton(
                  child: const Text("GUARDAR"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Validando...")),
                      );
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

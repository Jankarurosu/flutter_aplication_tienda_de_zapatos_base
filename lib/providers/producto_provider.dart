import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/models/producto.dart';
import 'package:flutter_application_clase1_actividad2/models/producto_response.dart';
import 'package:http/http.dart' as http;

class ProductoProvider extends ChangeNotifier {
  //IP PUERTO COMO URL BASE
  String _baseUrl = '192.168.18.33:3999';

  //Lista de productos
  List<Producto> listaProductos = [];

  ProductoProvider() {
    print('Ingresando a ProductoProvider');
    this.getOnProductoList();
  }
  //async espera a la api rest
  getOnProductoList() async {
    var url = Uri.http(_baseUrl, '/api/productos', {});
    final response = await http.get(url);
    print(response.body);
    final productoResponse = ProductoResponse.fromJson(response.body);
    listaProductos = productoResponse.productos;
    notifyListeners();
  }

  //Guardar los datos del formulario
  saveProducto(Producto producto) async {
    var url = Uri.http(_baseUrl, '/api/productos/save');
    print(producto.toJson());
    //await lo espera y lo guarda
    final response = await http.post(url,
        //Informacion
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        //Producto
        body: producto.toJson());
    print(response.body);
    //Actualizar la lista de productos
    getOnProductoList();
    //Alerta o notificacion
    notifyListeners();
  }
}

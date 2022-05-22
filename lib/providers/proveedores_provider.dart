import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/models/proveedores.dart';
import 'package:flutter_application_clase1_actividad2/models/proveedores_response.dart';
import 'package:http/http.dart' as http;

class ProveedoresProvider extends ChangeNotifier {
  //IP PUERTO COMO URL BASE
  String _baseUrl = '192.168.18.33:3999';

  //Lista de proveedores
  List<Proveedore> listaProveedores = [];

  ProveedoresProvider() {
    print('Ingresando a ProveedoresProvider');
    this.getOnProveedoresList();
  }
  //async espera a la api rest
  getOnProveedoresList() async {
    var url = Uri.http(_baseUrl, '/api/proveedores', {});
    final response = await http.get(url);
    print(response.body);
    final proveedoresResponse = ProveedoresResponse.fromJson(response.body);
    listaProveedores = proveedoresResponse.proveedores;
    notifyListeners();
  }

  //Guardar los datos del formulario
  saveProveedores(Proveedore proveedores) async {
    var url = Uri.http(_baseUrl, '/api/proveedores/save');
    print(proveedores.toJson());
    //await lo espera y lo guarda
    final response = await http.post(url,
        //Informacion
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        //Proveedores
        body: proveedores.toJson());
    print(response.body);
    //Actualizar la lista de proveedores
    getOnProveedoresList();
    //Alerta o notificacion
    notifyListeners();
  }
}

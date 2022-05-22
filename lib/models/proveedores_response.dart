import 'dart:convert';

import 'package:flutter_application_clase1_actividad2/models/proveedores.dart';

class ProveedoresResponse {
  ProveedoresResponse({
    required this.proveedores,
  });

  //Llamamos a la lista proveedores
  List<Proveedore> proveedores;

  factory ProveedoresResponse.fromJson(String str) =>
      ProveedoresResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProveedoresResponse.fromMap(Map<String, dynamic> json) =>
      ProveedoresResponse(
        proveedores: List<Proveedore>.from(
            json["proveedores"].map((x) => Proveedore.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "proveedores": List<dynamic>.from(proveedores.map((x) => x.toMap())),
      };
}

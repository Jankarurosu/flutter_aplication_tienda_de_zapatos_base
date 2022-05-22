import 'dart:convert';

class Proveedore {
  Proveedore({
    required this.id,
    required this.proveedoresId,
    required this.descripcion,
    required this.aporte,
  });

  String id;
  int proveedoresId;
  String descripcion;
  String aporte;

  factory Proveedore.fromJson(String str) =>
      Proveedore.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Proveedore.fromMap(Map<String, dynamic> json) => Proveedore(
        id: json["_id"],
        proveedoresId: json["proveedoresId"],
        descripcion: json["descripcion"],
        aporte: json["aporte"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "proveedoresId": proveedoresId,
        "descripcion": descripcion,
        "aporte": aporte,
      };
}

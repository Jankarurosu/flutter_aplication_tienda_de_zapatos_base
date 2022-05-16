import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/screens/login_screen.dart';
import 'package:flutter_application_clase1_actividad2/screens/principal_screen.dart';
import 'package:flutter_application_clase1_actividad2/screens/producto_form_screen.dart';
import 'package:flutter_application_clase1_actividad2/screens/productos_screen.dart';
import 'package:flutter_application_clase1_actividad2/screens/proveedores_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "POS APP",
      initialRoute: "ruta_principal", //POR DEFECTO LLAMA A LA RUTA LOGIN
      routes: {
        //Carlos Daniel Jorge Caqui
        "ruta_login": (_) => LoginScreen(),
        //Giancarlos Arom Olihua Guerra
        "ruta_principal": (_) => PrincipalScreen(),
        //***
        "ruta_productos": (_) => ProductosScreen(),
        //***
        "ruta_productos_form": (_) => ProductoFormScreen(),
        //Zahir Alejandro Montoya Coacalla
        "ruta_proveedores": (_) => ProveedoresScreen()
      },
    );
  }
}

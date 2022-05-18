import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/providers/producto_provider.dart';
import 'package:flutter_application_clase1_actividad2/screens/login_screen.dart';
import 'package:flutter_application_clase1_actividad2/screens/principal_screen.dart';
import 'package:flutter_application_clase1_actividad2/screens/producto_form_screen.dart';
import 'package:flutter_application_clase1_actividad2/screens/productos_screen.dart';
import 'package:flutter_application_clase1_actividad2/screens/proveedores_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductoProvider(), lazy: false),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Tienda de zapatos",
        initialRoute: "ruta_principal", //POR DEFECTO LLAMA A LA RUTA PRINCIPAL
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
      ),
    );
  }
}

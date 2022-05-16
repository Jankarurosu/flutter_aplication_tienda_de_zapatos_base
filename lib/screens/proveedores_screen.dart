import 'package:flutter/material.dart';
import 'package:flutter_application_clase1_actividad2/widgets/menu_lateral.dart';

class ProveedoresScreen extends StatefulWidget {
  const ProveedoresScreen({Key? key}) : super(key: key);
  @override
  State<ProveedoresScreen> createState() => _ProveedoresScreen();
}

class _ProveedoresScreen extends State<ProveedoresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proveedores"),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: Text("Proveedores"),
      ),
    );
  }
}

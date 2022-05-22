import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text(""),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logo.jpg"), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            title: const Text("Principal"),
            onTap: () {
              Navigator.pushNamed(context, "ruta_principal");
            },
          ),
          ListTile(
            title: const Text("Productos"),
            onTap: () {
              Navigator.pushNamed(context, "ruta_productos");
            },
          ),
          ListTile(
            title: const Text("Carrito de Compras"),
            onTap: () {
              Navigator.pushNamed(context, "ruta_carrito");
            },
          ),
          ListTile(
            title: const Text("Proveedores"),
            onTap: () {
              Navigator.pushNamed(context, "ruta_proveedores");
            },
          ),
          Divider(color: Colors.black),
          ListTile(
            title: const Text("Iniciar Sesion o Registrarse"),
            onTap: () {
              Navigator.pushNamed(context, "ruta_login");
            },
          ),
        ],
      ),
    );
  }
}

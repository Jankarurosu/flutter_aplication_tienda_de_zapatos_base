import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final txtUser = TextEditingController();
    final txtPass = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "",
                  labelText: "Usuario",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(Icons.person),
                ),
                controller: txtUser,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingresa un usuario";
                  }
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "***",
                  labelText: "Contraseña",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(Icons.lock_outline),
                ),
                controller: txtPass,
                validator: (value) {
                  if (value!.length < 3) {
                    return "La contraseña debe tener minimo 3 caracteres";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 30),
              Container(
                child: ElevatedButton(
                  child: const Text("INGRESAR"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Validando..."),
                          backgroundColor: Colors.blueAccent,
                        ),
                      );
                      if (txtUser.text == "admin" && txtPass.text == "123") {
                        Navigator.pushReplacementNamed(
                            context, "ruta_principal");
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Credenciales incorrectas..."),
                          backgroundColor: Colors.blueAccent,
                        ));
                      }
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

import 'package:flutter/material.dart';

class Patrocinador extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Llenar campo";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      return "Introduzca email valido";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Llenar campo";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Telefono",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Llenar campo";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Pais",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                ElevatedButton(
                  child: const Text('Guardar'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Guardar");
                    }
                  },
                )
              ],
            ),
          )),
    );
  }
}

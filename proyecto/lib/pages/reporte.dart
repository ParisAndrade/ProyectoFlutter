import 'package:flutter/material.dart';

class Reporte extends StatelessWidget {
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
                      labelText: "Motivo",
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
                      labelText: "Fecha",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: 5,
                  maxLength: 1000,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Llenar campo";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Descripcion",
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
                      labelText: "Direccion",
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
                      labelText: "Lugar",
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
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:proyecto/models/reporte.dart';

class ReporteProvider extends ChangeNotifier {
  final String _host = 'trashreport.somee.com';
  // final Map<String, dynamic> _parameters = {'': ''};
  List<Reportes> displayReportes = [];

  ReporteProvider() {
    getReporte();
  }

  getReporte() async {
    const String endPoint = 'api/Reportes';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      displayReportes = List<Reportes>.from(
          json.decode(response).map((x) => Reportes.fromJson(x)));
      notifyListeners();
    } finally {
      client.close();
    }
  }
}

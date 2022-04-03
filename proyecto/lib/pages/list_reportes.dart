import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/providers/provider.dart';

class ListReportes extends StatelessWidget {
  const ListReportes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reporteProvider = Provider.of<ReporteProvider>(context);
    final reportes = reporteProvider.displayReportes;
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListReportes'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(reportes[index].fullMotivo),
            ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: reportes.length));
  }
}

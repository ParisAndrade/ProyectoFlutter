import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/pages/home.dart';
import 'package:proyecto/pages/evento.dart';
import 'package:proyecto/pages/list_reportes.dart';
import 'package:proyecto/pages/login.dart';
import 'package:proyecto/pages/patrocinador.dart';
import 'package:proyecto/pages/reporte.dart';
import 'package:proyecto/pages/usuario.dart';
import 'package:proyecto/providers/provider.dart';

void main() => runApp(const AppState());

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (cert, host, port) => true;
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ReporteProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Widget> list = [
    Home(),
    Evento(),
    ListReportes(),
    Usuario(),
    Patrocinador(),
    Login()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TrashReport"),
        ),
        body: list[index],
        drawer: MyDrawer(
          onTap: (ctx, i) {
            setState(() {
              index = i;
              Navigator.pop(ctx);
            });
          },
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;

  MyDrawer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            child: const CircleAvatar(
                              backgroundImage: AssetImage('assets/foto.jpg'),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Paris Andrade',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            'parisandrade@gmail.com',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () => onTap(context, 0),
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Evento'),
                    onTap: () => onTap(context, 1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.paste),
                    title: const Text('Reporte'),
                    onTap: () => onTap(context, 2),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Usuario'),
                    onTap: () => onTap(context, 3),
                  ),
                  ListTile(
                    leading: const Icon(Icons.people),
                    title: const Text('Patrocinador'),
                    onTap: () => onTap(context, 4),
                  ),
                  Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('LogOut'),
                    onTap: () => onTap(context, 5),
                  ),
                ]),
          ),
        ));
  }
}

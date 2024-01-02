import 'package:flutter_application_1/screens/form_screen.dart';

import 'screens/tela_inicial.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  bool opacidade = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Pratics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen(),
    );
  }
}
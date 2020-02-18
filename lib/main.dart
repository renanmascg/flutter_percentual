import 'package:flutter/material.dart';
import 'package:flutter_perfil_investidor/perfil_investidor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PerfilInvestidor(),
    );
  }
}



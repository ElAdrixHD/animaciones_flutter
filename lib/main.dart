import 'package:animaciones_flutter/src/pages/home.dart';
import 'package:animaciones_flutter/src/retos/cuadrado_animado.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animaciones',
      debugShowCheckedModeBanner: false,
      initialRoute: CuadradoAnimadoPage.route,
      onGenerateRoute: (settings){
        switch(settings.name){
          case HomePage.route:
            return MaterialPageRoute(builder: (_) => HomePage());

          case CuadradoAnimadoPage.route:
            return MaterialPageRoute(builder: (_) => CuadradoAnimadoPage());

          default:
           return MaterialPageRoute(builder: (_) => HomePage());
        }
      },
    );
  }
}
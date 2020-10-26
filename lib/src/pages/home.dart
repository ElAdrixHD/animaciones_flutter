import 'package:flutter/material.dart';
import 'dart:math' as Math;

class HomePage extends StatelessWidget {
  static const String route = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado(),)
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> rotation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 4));

    rotation = Tween(begin: 0.0, end: 2.0 * Math.pi ,).animate(controller);


    controller.addListener(() { 
      if(controller.status == AnimationStatus.completed){
        controller.repeat();
      }
     });  

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (cxt, child){
        return Transform.rotate(
          angle: rotation.value,
          child: child);
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}




class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.green,
       ),
    );
  }
}
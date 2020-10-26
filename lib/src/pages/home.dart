import 'package:flutter/material.dart';
import 'dart:math' as Math;

class HomePage extends StatelessWidget {
  static const String route = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.centerLeft,
        child: CuadradoAnimado())
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
  Animation<double> opacity;
  Animation<double> opacityOut;
  Animation<double> move;
  Animation<double> growUp;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 4,));

    rotation = Tween(begin: 0.0, end: 2.0 * Math.pi ,).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc)
    );

    opacity = Tween(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0,0.25, curve: Curves.fastLinearToSlowEaseIn))
    );

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75,1, curve: Curves.fastLinearToSlowEaseIn))
    );

    move = Tween(begin: 0.0, end: 250.0).animate( controller );

    growUp = Tween(begin: 0.0, end: 2.0).animate( controller );


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
        return Transform.translate(
          offset: Offset(move.value,0),
            child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
                  opacity: opacity.value - opacityOut.value,
                  child: Transform.scale(
                    scale: growUp.value,
                    child: child),
              )),
        );
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
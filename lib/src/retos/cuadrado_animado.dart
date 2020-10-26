import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  static const route = "/cuadrado";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _CuadradoAnimado(),),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin{

  AnimationController controller; //BounceOut
  Animation<double> right;
  Animation<double> top;
  Animation<double> left;
  Animation<double> bottom;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4500));
    
    right = Tween(begin: 0.0, end: 100.0,).animate(
      CurvedAnimation(parent: controller, curve: Interval(0,0.25,curve: Curves.bounceOut))
    );
    top = Tween(begin: 0.0, end: 100.0,).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.25,0.5,curve: Curves.bounceOut))
    );
    left = Tween(begin: 0.0, end: 100.0,).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.5,0.75,curve: Curves.bounceOut))
    );
    bottom = Tween(begin: 0.0, end: 100.0,).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75,1,curve: Curves.bounceOut))
    );
    
    
    controller.addListener(() {
      if(controller.status == AnimationStatus.completed){
        controller.repeat();
      }
    });

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        child: _Rectangulo(),
        builder: (cxt, child){
          return Transform.translate(
            offset: Offset(right.value - left.value, bottom.value - top.value),
            child: child,);
        },
      );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue,
       ),
    );
  }
}
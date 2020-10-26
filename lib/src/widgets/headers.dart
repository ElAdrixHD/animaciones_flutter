import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {

  final double ratioPantalla;
  final Color color;

  const HeaderCuadrado({this.ratioPantalla = 0.4, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*ratioPantalla,
      color: color,
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {

  final double ratioPantalla;
  final Color color;
  final double radioAbajoIzq;
  final double radioAbajoDer;

  HeaderBordesRedondeados({this.ratioPantalla = 0.4, this.color = Colors.blue, this.radioAbajoIzq = 70.0, this.radioAbajoDer = 70.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*ratioPantalla,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radioAbajoIzq), bottomRight: Radius.circular(radioAbajoDer),),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  final double ratioStart;
  final double ratioEnd;
  final Color color;


  HeaderDiagonal({this.ratioStart = 0.4, this.ratioEnd= 0.3, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(color: color, ratioEnd: ratioEnd, ratioStart: ratioStart),
      ),
    );
  }
}

class HeaderTriangular extends StatelessWidget {

  final double ratioStart;
  final double ratioEnd;
  final Color color;


  HeaderTriangular({this.ratioStart = 1, this.ratioEnd= 1, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(color: color, ratioEnd: ratioEnd, ratioStart: ratioStart),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{

  final double ratioStart;
  final double ratioEnd;
  final Color color;

  _HeaderTriangularPainter({this.ratioStart, this.ratioEnd, this.color});

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    path.lineTo(size.width*ratioEnd, size.height*ratioStart);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

    //Dibujar con Path
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}

class HeaderPico extends StatelessWidget {

  final double ratioPantalla;
  final double ratioYPico;
  final double ratioXPico;
  final Color color;


  HeaderPico({this.ratioPantalla = 0.3, this.ratioXPico = 0.5, this.ratioYPico= 0.4, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(color: color, ratioXPico: ratioXPico, ratioYPico: ratioYPico, ratioPantalla: ratioPantalla),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{

  final double ratioPantalla;
  final double ratioYPico;
  final double ratioXPico;
  final Color color;

  _HeaderPicoPainter({this.ratioPantalla, this.ratioXPico, this.ratioYPico, this.color});

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    path.lineTo(0, size.height*ratioPantalla);
    path.lineTo(size.width*ratioXPico, size.height*ratioYPico);
    path.lineTo(size.width, size.height*ratioPantalla);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

    //Dibujar con Path
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}

class HeaderCurvo extends StatelessWidget {

  final double ratioPantalla;
  final double ratioYPico;
  final double ratioXPico;
  final Color color;


  HeaderCurvo({this.ratioPantalla = 0.3, this.ratioXPico = 0.2, this.ratioYPico= 0.5, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(color: color, ratioXPico: ratioXPico, ratioYPico: ratioYPico, ratioPantalla: ratioPantalla),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{

  final double ratioPantalla;
  final double ratioYPico;
  final double ratioXPico;
  final Color color;

  _HeaderCurvoPainter({this.ratioPantalla, this.ratioXPico, this.ratioYPico, this.color});

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    path.lineTo(0, size.height*ratioPantalla);
    path.quadraticBezierTo(size.width*ratioXPico, size.height*ratioYPico, size.width, size.height*ratioPantalla);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

    //Dibujar con Path
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}

class HeaderWave extends StatelessWidget {

  final double ratioPantalla;
  final double ratioYPico1;
  final double ratioXPico1;
  final double cambioDir;
  final double ratioYPico2;
  final double ratioXPico2;
  final Color color;
  final Gradient gradiente;


  HeaderWave({this.ratioPantalla = 0.3, this.ratioXPico1 = 0.25, this.ratioYPico1= 0.25, this.cambioDir = 0.5, this.ratioXPico2 = 0.75, this.ratioYPico2= 0.35, this.color = Colors.blue, this.gradiente});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(color: color, ratioXPico1: ratioXPico1, ratioYPico1: ratioYPico1, ratioXPico2: ratioXPico2, ratioYPico2: ratioYPico2, cambioDir: cambioDir, ratioPantalla: ratioPantalla, gradiente: gradiente),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter{

  final double ratioPantalla;
  final double ratioYPico1;
  final double ratioXPico1;
  final double cambioDir;
  final double ratioYPico2;
  final double ratioXPico2;
  final Color color;
  final Gradient gradiente;

  _HeaderWavePainter({this.ratioPantalla, this.ratioXPico1, this.ratioYPico1, this.cambioDir, this.ratioXPico2, this.ratioYPico2, this.color = Colors.blue, this.gradiente});

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();
    final rect = Rect.fromCircle(
      center: Offset(size.width*0.5,size.height*(ratioPantalla/2)),
      radius: 180,
    );

    // Propiedades
    lapiz.color = color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;
    lapiz.shader = gradiente?.createShader(rect);

    final path = Path();
    path.lineTo(0, size.height*ratioPantalla);
    path.quadraticBezierTo(size.width*ratioXPico1, size.height*ratioYPico1, size.width*cambioDir, size.height*ratioPantalla);
    path.quadraticBezierTo(size.width*ratioXPico2, size.height*ratioYPico2, size.width, size.height*ratioPantalla);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

    //Dibujar con Path
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}

class _HeaderDiagonalPainter extends CustomPainter{

  final double ratioStart;
  final double ratioEnd;
  final Color color;

  _HeaderDiagonalPainter({this.ratioStart, this.ratioEnd, this.color});

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    path.lineTo(0, size.height*ratioStart);
    path.lineTo(size.width, size.height*ratioEnd);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

    //Dibujar con Path
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
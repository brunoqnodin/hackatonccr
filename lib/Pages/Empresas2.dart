import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prisma/Pages/Empresas.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Empresas2 extends StatefulWidget {
  @override
  _Empresas2State createState() => _Empresas2State();
}

class _Empresas2State extends State<Empresas2> {
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Image.asset(
          "assets/logo.png",
          height: 40,
        ),
        backgroundColor: Colors.black54,
        elevation: 15,
        centerTitle: true,
      ),
      body: Empresas(),
    );
  }
}

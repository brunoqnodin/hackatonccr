import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prisma/Pages/Dashboard.dart';

class Dashboard2 extends StatefulWidget {
  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          "assets/logoopenminer2.png",
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 15,
        centerTitle: true,
      ),
      body: Dashboard(),
    );
  }
}

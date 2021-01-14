import 'package:flutter/material.dart';
import 'package:prisma/Contas.dart';
import 'package:prisma/Pages/Dashboard2.dart';
import 'package:prisma/Pages/DetalheCurso.dart';
import 'package:prisma/Pages/Cadastro.dart';
import 'package:prisma/Pages/Cadastro1.dart';
import 'package:prisma/Pages/Dashboard.dart';
import 'package:prisma/Pages/LoginPage.dart';
import 'package:prisma/Pages/CadLogin.dart';
import 'package:prisma/Pages/Perfil.dart';
import 'package:prisma/Pages/ResetPassword.dart';
import 'package:prisma/Pages/Home.dart';
import 'package:prisma/Pages/Splash.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    String _resultado = "";
    final args = settings.arguments as String;

    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => LoginPage());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginPage());
      case "/cadastro":
        return MaterialPageRoute(builder: (_) => Cadastro());
      case "/cadLogin":
        return MaterialPageRoute(builder: (_) => CadLogin());
      case "/reset":
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case "/cadastro1":
        return MaterialPageRoute(builder: (_) => Cadastro1());
      case "/contas":
        return MaterialPageRoute(builder: (_) => Contas());
      case "/dashboard2":
        return MaterialPageRoute(builder: (_) => Dashboard2());
      case "/perfil":
        return MaterialPageRoute(builder: (_) => Perfil());
      case "/dashboard":
        return MaterialPageRoute(builder: (_) => Dashboard());
      case "/detalhecurso":
        return MaterialPageRoute(builder: (_) => DetalheCurso());
      case "/home":
        return MaterialPageRoute(builder: (_) => Home());
      case "/splash":
        return MaterialPageRoute(builder: (_) => Splash());
      default: _erroRota();
    }

  }
  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
      builder: (_){
        return Scaffold(
          appBar: AppBar(title: Text("Tela não encontrada"),),
          body: Center(child: Text("Tela não encontrada"),),
        );
      }
    );
  }
}

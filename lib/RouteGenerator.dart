import 'package:flutter/material.dart';
import 'package:prisma/Contas.dart';
import 'package:prisma/Pages/Dashboard2.dart';
import 'package:prisma/Pages/DetalheCurso.dart';
import 'package:prisma/Pages/Cadastro.dart';
import 'package:prisma/Pages/Dashboard.dart';
import 'package:prisma/Pages/Empresas.dart';
import 'package:prisma/Pages/Formulario.dart';
import 'package:prisma/Pages/LoginPage.dart';
import 'package:prisma/Pages/CadLogin.dart';
import 'package:prisma/Pages/Perfil.dart';
import 'package:prisma/Pages/Perfil2.dart';
import 'package:prisma/Pages/ResetPassword.dart';
import 'package:prisma/Pages/Home.dart';
import 'package:prisma/Pages/Splash.dart';
import 'package:prisma/Pages/Trilhas2.dart';
import 'file:///C:/Users/bnobre/AndroidStudioProjects/prisma/lib/Pages/TrilhaAprendizado.dart';

import 'Pages/Empresas2.dart';

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
      case "/contas":
        return MaterialPageRoute(builder: (_) => Contas());
      case "/dashboard2":
        return MaterialPageRoute(builder: (_) => Dashboard2());
      case "/perfil":
        return MaterialPageRoute(builder: (_) => Perfil());
      case "/perfil2":
        return MaterialPageRoute(builder: (_) => Perfil2());
      case "/trilhaaprendizado":
        return MaterialPageRoute(builder: (_) => TrilhaAprendizado());
      case "/trilhas2":
        return MaterialPageRoute(builder: (_) => Trilhas2());
      case "/dashboard":
        return MaterialPageRoute(builder: (_) => Dashboard());
      case "/detalhecurso":
        return MaterialPageRoute(builder: (_) => DetalheCurso());
      case "/empresas":
        return MaterialPageRoute(builder: (_) => Empresas());
      case "/empresas2":
        return MaterialPageRoute(builder: (_) => Empresas2());
      case "/formulario":
        return MaterialPageRoute(builder: (_) => Formulario());
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

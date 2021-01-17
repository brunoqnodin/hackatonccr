import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prisma/Pages/TrilhaAprendizado.dart';

class Trilhas2 extends StatefulWidget {
  @override
  _Trilhas2State createState() => _Trilhas2State();
}

class _Trilhas2State extends State<Trilhas2> {
  var _idUsuarioLogado;
  String _nomeUsuario;
  String _emailUsuario;
  String _urlImagemRecuperada;
  _recuperarDadosUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    _idUsuarioLogado = usuarioLogado.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios").doc(_idUsuarioLogado).get();

    Map<String, dynamic> dados = snapshot.data();

    if(dados["urlImagem"] != null){
      setState(() {
        _urlImagemRecuperada = dados["urlImagem"];
        _nomeUsuario = dados["nome"];
        _emailUsuario = dados["email"];
      });
    }
  }
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
      body: TrilhaAprendizado(),
    );
  }
}

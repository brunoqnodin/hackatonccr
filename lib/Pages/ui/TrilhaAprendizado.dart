import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TrilhaAprendizado extends StatefulWidget {
  @override
  _TrilhaAprendizadoState createState() => _TrilhaAprendizadoState();
}

class _TrilhaAprendizadoState extends State<TrilhaAprendizado> {
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
  void initState(){
    super.initState();
    _recuperarDadosUsuario();
  }
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xFF5F5775),
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  backgroundImage: _urlImagemRecuperada != null ? NetworkImage("${_urlImagemRecuperada}") : null,
                ),
                Column(
                  children: [
                    Text(
                      "${_nomeUsuario.toString()}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${_emailUsuario.toString()}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                Text(
                  "TRILHA DE ",
                  style: TextStyle(fontSize: 18, color: Color(0xFFFF5F5775)),
                ),
                Text(
                  "APRENDIZADO",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFF5F5775),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: 350,
            decoration: BoxDecoration(
              color: Color(0xFFFF5F5775),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '''COMO INGRESSAR NO
MERCADO DE TRABALHO?''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Text(
                            "Data de inicio:",
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            "17/01/2021",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Text(
                            "Data de términio:",
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            "10 dias",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Image.asset("assets/image2.png"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green,),
                    Text("Modulo 1 | Currículo", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),),
                    Text("100% Completado", style: TextStyle(fontSize: 10),),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green,),
                    Text("Como fazer um currículo vitae", style: TextStyle(fontSize: 18, color: Colors.black54),),
                    LinearPercentIndicator(
                      width: 80,
                      lineHeight: 10,
                      percent: 1.0,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.deepPurple,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green,),
                    Text("Modelo de currículo", style: TextStyle(fontSize: 18, color: Colors.black54),),
                    SizedBox(
                      width: 82,
                    ),
                    LinearPercentIndicator(
                      width: 80,
                      lineHeight: 10,
                      percent: 1.0,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.deepPurple,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green,),
                    Text('''Como criar um 
perfil no LinkendIn''', style: TextStyle(fontSize: 18, color: Colors.black54),),
                    SizedBox(
                      width: 95,
                    ),
                    LinearPercentIndicator(
                      width: 80,
                      lineHeight: 10,
                      percent: 1.0,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.deepPurple,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.amber,),
                    Text("Modulo 2 | Entrevista", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),),
                    Text("50% Completado", style: TextStyle(fontSize: 10),),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green,),
                    Text("Se preparando para entrevista", style: TextStyle(fontSize: 18, color: Colors.black54),),
                    LinearPercentIndicator(
                      width: 80,
                      lineHeight: 10,
                      percent: 1.0,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.deepPurple,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.amber,),
                    Text("Possiveis Testes", style: TextStyle(fontSize: 18, color: Colors.black54),),
                    SizedBox(
                      width: 105,
                    ),
                    LinearPercentIndicator(
                      width: 80,
                      lineHeight: 10,
                      percent: 0.5,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.deepPurple,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.grey,),
                    Text('''Perguntas frequentes em
entrevistas''', style: TextStyle(fontSize: 18, color: Colors.black54),),
                    SizedBox(
                      width: 37,
                    ),
                    LinearPercentIndicator(
                      width: 80,
                      lineHeight: 10,
                      percent: 0.0,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.deepPurple,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.grey,),
                    Text("Modulo 3 | Empreenda-se", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),),
                    Text("0% Completado", style: TextStyle(fontSize: 10),),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.grey,),
                    Text("Montar um modelo de negócio", style: TextStyle(fontSize: 18, color: Colors.black54),),
                    LinearPercentIndicator(
                      width: 80,
                      lineHeight: 10,
                      percent: 0.0,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.deepPurple,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.grey,),
                    Text("O que é um MVP?", style: TextStyle(fontSize: 18, color: Colors.black54),),
                    SizedBox(
                      width: 102,
                    ),
                    LinearPercentIndicator(
                      width: 80,
                      lineHeight: 10,
                      percent: 0.0,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.deepPurple,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

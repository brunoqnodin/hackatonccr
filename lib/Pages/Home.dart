import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prisma/Contas.dart';
import 'package:prisma/Pages/Cadastro.dart';
import 'package:prisma/Pages/Empresas.dart';
import 'package:prisma/Pages/Extratos.dart';
import 'package:prisma/Pages/Dashboard.dart';
import 'package:prisma/Pages/Perfil.dart';
import 'package:prisma/Pages/Solicita.dart';
import 'file:///C:/Users/bnobre/AndroidStudioProjects/prisma/lib/Pages/TrilhaAprendizado.dart';
import 'package:prisma/Pages/ui/clipper.dart';
import 'package:prisma/Pages/ui/draweropen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _emailUsuario = "";
  String nomeUsuario;
  int _indiceAtual = 0;
  String _idUsuarioLogado;
  String _urlImagemRecuperada;
  List<String> itensMenu = ["Sair"];

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
        nomeUsuario = dados["nome"];
      });
    }
  }


  _escolhaMenuItem(String itemEscolhido){
    switch (itemEscolhido){
      case "Sair":
        _logoffUsuario();
        break;
    }
  }
  _logoffUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  void initState(){
    super.initState();
    _recuperarDadosUsuario();
  }
  Widget build(BuildContext context) {
    List<Widget> paginas = [
      Dashboard(),
      Empresas(),
      TrilhaAprendizado(),
      Perfil()
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Image.asset("assets/logo.png", height: 40,),
        backgroundColor: Colors.black54,
        elevation: 15,
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context){
              return itensMenu.map((String item){
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: paginas[_indiceAtual],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0xFF5F5775),
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              label: "Dashboard",
              icon: Icon(Icons.insert_drive_file)
          ),
          BottomNavigationBarItem(
              label: "Oportunidades",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "Minhas Trilhas",
              icon: Icon(Icons.insert_chart)
          ),
          BottomNavigationBarItem(
             label: "Perfil",
              icon: Icon(Icons.account_circle)
          ),
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: OpenBankingDrawer(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class OpenBankingDrawer extends StatefulWidget {
  @override
  _OpenBankingDrawerState createState() => _OpenBankingDrawerState();
}

class _OpenBankingDrawerState extends State<OpenBankingDrawer> {


  var _idUsuarioLogado;
  String _urlImagemRecuperada;
  String _nomeUsuario;
  String _emailUsuario;

  List<String> itensMenu = ["Perfil", "Sair"];
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
    return ClipPath(
      //clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      backgroundImage: _urlImagemRecuperada != null ? NetworkImage("${_urlImagemRecuperada}") : null,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${_nomeUsuario.toString()}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF5F5775),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.grey,
                onPressed: (){
                  Navigator.pushNamed(context, "/dashboard2");
                },
                icon: Icon(Icons.dashboard),
                label: Text("      Dashboard"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.grey,
                onPressed: (){},
                icon: Icon(Icons.navigation_outlined),
                label: Text("      Trilhas de aprendizado"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.grey,
                onPressed: (){},
                icon: Icon(Icons.emoji_objects_outlined),
                label: Text("      Oportunidades"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.grey,
                onPressed: (){
                },
                icon: Icon(Icons.monetization_on_rounded),
                label: Text("      Carteira"),
              ),
            ),Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.grey,
                onPressed: (){
                  Navigator.pushNamed(context, "/perfil");
                },
                icon: Icon(Icons.person),
                label: Text("      Perfil"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.grey,
                onPressed: (){
                  _logoffUsuario();
                },
                icon: Icon(Icons.exit_to_app),
                label: Text("      Sair"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
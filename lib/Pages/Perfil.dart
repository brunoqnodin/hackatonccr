import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  var _idUsuarioLogado;
  String _nomeUsuario;
  String _emailUsuario;
  String _urlImagemRecuperada;
  File _imagem;
  bool _subindoImagem = false;
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

  _atualizarUrlImagemFirestore(String url){
    FirebaseFirestore db = FirebaseFirestore.instance;
    Map<String, dynamic> dadosAtualizar = {
      "urlImagem": url
    };
    db.collection("usuarios").doc(_idUsuarioLogado).update(dadosAtualizar);
  }

  Future _recuperarUrlImagem(TaskSnapshot snapshot)async{
    String url = await snapshot.ref.getDownloadURL();
    _atualizarUrlImagemFirestore(url);
    setState(() {
      _urlImagemRecuperada = url;
    });
  }

 //

  Future _recuperarImage(String origemImagem)async{
    File imagemSelecionada;
    switch(origemImagem){
      case "camera":
        imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
        break;
      case "galeria":
        imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
        break;
    }

    setState(() {
      _imagem = imagemSelecionada;
      if(_imagem != null){
        _subindoImagem = true;
        _uploadImagem();
      }
    });
  }

  Future _uploadImagem()async{
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz
        .child("perfil")
        .child(_idUsuarioLogado + ".jpg");
    //Upload imagem
    UploadTask task = arquivo.putFile(_imagem);
    //controlar progresso do upload
    task.snapshotEvents.listen((TaskSnapshot storageTaskEvent){
      if(storageTaskEvent.runtimeType == TaskState.running){
        setState(() {
          _subindoImagem = true;
        });
      }else if(storageTaskEvent.runtimeType == TaskState.success){
        setState(() {
          _subindoImagem = false;
        });
      }
    });
    //Recuperar url da imagem
    task.then((TaskSnapshot snapshot){
      _recuperarUrlImagem(snapshot);
    });

  }

 //
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
                FlatButton(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    backgroundImage: _urlImagemRecuperada != null ? NetworkImage("${_urlImagemRecuperada}") : null,
                  ),
                  onPressed: (){
                    _recuperarImage("galeria");
                  },
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
                  "MINHAS ",
                  style: TextStyle(fontSize: 18, color: Color(0xFFFF5F5775)),
                ),
                Text(
                  "TRILHAS",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFF5F5775),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      color: Color(0XFFF5F5F5),
                      width: 150,
                      child: Image.asset("assets/image.png"),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        width: 150,
                        child: Text(
                          "Nome da ONG parceira",
                          style: TextStyle(color: Color(0xFFFF5F5775)),
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        width: 150,
                        child: Text(
                          "Para Ingressar no Mercado de Trabalho",
                          style: TextStyle(
                              color: Color(0xFFFF5F5775),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                    LinearPercentIndicator(
                      width: 150,
                      lineHeight: 10,
                      percent: 0.8,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.deepPurple,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Color(0xFFFF5F5775),
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "COMO INGRESSAR NO MERCADO DE TRABALHO?",
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
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Container(
                          height: 35,
                          width: 220,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white70,
                          ),
                          child: SizedBox.expand(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/detalhecurso");
                              },
                              child: Text(
                                "Acessar",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 45,
            width: 220,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFFF5F5775),
            ),
            child: SizedBox.expand(
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Ver todas",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 10),
            child: Row(
              children: [
                Text(
                  "MINHAS ",
                  style: TextStyle(fontSize: 18, color: Color(0xFFFF5F5775)),
                ),
                Text(
                  "VAGAS",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFF5F5775),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.centerLeft,
            child: Text("Veja as ultimas vagas que você aplicou", style: TextStyle(fontSize: 14, color: Color(0xFFFF5F5775))),
          ),
          Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: 450,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(

                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Color(0XFFF5F5F5),
                            width: 150,
                            height: 150,
                            child: Image.asset("assets/code4you.png"),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 150,
                              child: Text(
                                "Code 4 You",
                                style: TextStyle(color: Color(0xFFFF5F5775)),
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 150,
                              child: Text(
                                "Auxiliar Programador Front-End Vue.JS",
                                style: TextStyle(
                                    color: Color(0xFFFF5F5775),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                          LinearPercentIndicator(
                            width: 150,
                            lineHeight: 10,
                            percent: 0.4,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RaisedButton(
                                  onPressed: (){},
                                  child: Text("Vagas"),
                                  textColor: Colors.white,
                                  color: Colors.deepPurple,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RaisedButton(
                                  onPressed: (){},
                                  child: Text("TI"),
                                  textColor: Colors.white,
                                  color: Colors.deepPurple,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Color(0XFFF5F5F5),
                            width: 150,
                            height: 150,
                            child: Image.asset("assets/codebank.png"),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 150,
                              child: Text(
                                "CodeBank",
                                style: TextStyle(color: Color(0xFFFF5F5775)),
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 150,
                              child: Text(
                                "Testes Automatizados em JEST",
                                style: TextStyle(
                                    color: Color(0xFFFF5F5775),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                          LinearPercentIndicator(
                            width: 150,
                            lineHeight: 10,
                            percent: 0.8,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RaisedButton(
                                  onPressed: (){},
                                  child: Text("Vagas"),
                                  textColor: Colors.white,
                                  color: Colors.deepPurple,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RaisedButton(
                                  onPressed: (){},
                                  child: Text("TI"),
                                  textColor: Colors.white,
                                  color: Colors.deepPurple,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Color(0XFFF5F5F5),
                            width: 150,
                            child: Image.asset("assets/iak9.png"),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 150,
                              child: Text(
                                "IAK9 Tech",
                                style: TextStyle(color: Color(0xFFFF5F5775)),
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 150,
                              child: Text(
                                "Ass. de programação básico HTML, CSS e Javascript",
                                style: TextStyle(
                                    color: Color(0xFFFF5F5775),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                          LinearPercentIndicator(
                            width: 150,
                            lineHeight: 10,
                            percent: 0.6,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RaisedButton(
                                  onPressed: (){},
                                  child: Text("Vagas"),
                                  textColor: Colors.white,
                                  color: Colors.deepPurple,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RaisedButton(
                                  onPressed: (){},
                                  child: Text("TI"),
                                  textColor: Colors.white,
                                  color: Colors.deepPurple,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Color(0XFFF5F5F5),
                            width: 150,
                            height: 140,
                            child: Image.asset("assets/sw.png"),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 150,
                              child: Text(
                                "Simple Ware",
                                style: TextStyle(color: Color(0xFFFF5F5775)),
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 150,
                              child: Text(
                                "Assistente de desenvolvimento de softwares embarcados",
                                style: TextStyle(
                                    color: Color(0xFFFF5F5775),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                          LinearPercentIndicator(
                            width: 150,
                            lineHeight: 10,
                            percent: 0.1,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RaisedButton(
                                  onPressed: (){},
                                  child: Text("Vagas"),
                                  textColor: Colors.white,
                                  color: Colors.deepPurple,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RaisedButton(
                                  onPressed: (){},
                                  child: Text("TI"),
                                  textColor: Colors.white,
                                  color: Colors.deepPurple,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "MINHA ",
                  style: TextStyle(fontSize: 18, color: Color(0xFFFF5F5775)),
                ),
                Text(
                  "EVOLUÇÃO",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFF5F5775),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.auto_awesome),
                Text("115 pts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: LinearPercentIndicator(
              width: 350,
              lineHeight: 20,
              percent: 0.3,
              backgroundColor: Colors.grey,
              progressColor: Colors.amber,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black12,
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.check_circle, color: Colors.green,),
                      ),
                      Text(
                        "Finalizar Cadastro",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        "15 pts"
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black12,
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.check_circle, color: Colors.green,),
                      ),
                      Text(
                        "Questionário",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        "50 pts"
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 30),
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black12,
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.check_circle, color: Colors.green,),
                      ),
                      Text(
                        "Completar Tutorial",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        "50 pts"
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

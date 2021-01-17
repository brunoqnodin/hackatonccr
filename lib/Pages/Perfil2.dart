import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:prisma/Pages/Perfil.dart';

class Perfil2 extends StatefulWidget {
  @override
  _Perfil2State createState() => _Perfil2State();
}

class _Perfil2State extends State<Perfil2> {
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
      body: Perfil(),
    );
  }
}

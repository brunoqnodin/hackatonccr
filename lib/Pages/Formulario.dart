import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerDataNascimento = TextEditingController();
  var maskFormatterData = new MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') });
  var valor1;
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Questionario", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              Text("Para nossa IA poder te ajudar a encontrar as melhores trilhas e oportunidades, responda o questionário abaixo:", style: TextStyle(fontSize: 16),),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Colors.deepPurple,
                  controller: _controllerNome,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Nome Completo",
                    labelStyle:
                    TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF2A5C5B),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  inputFormatters: [maskFormatterData],
                  cursorColor: Colors.deepPurple,
                  controller: _controllerDataNascimento,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Data de Nascimento",
                    labelStyle:
                    TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF2A5C5B),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("O QUE VOCÊ PROCURA?"),

            ],
          ),
        ),
      ),
    );
  }
}

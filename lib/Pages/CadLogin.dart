import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prisma/Pages/ui/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prisma/Pages/ui/clipper.dart';

class CadLogin extends StatefulWidget {
  @override
  _CadLoginState createState() => _CadLoginState();
}

class _CadLoginState extends State<CadLogin> {
  bool _contrato = false;
  bool _contratonovo;

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  FocusNode _nodeEmail = FocusNode();
  FocusNode _nodeNome = FocusNode();
  FocusNode _nodeSenha = FocusNode();

  _logoffUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }

  _cadastrarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      FirebaseFirestore db = FirebaseFirestore.instance;
      db.collection("usuarios").doc(firebaseUser.user.uid).set(usuario.toMap());

      _logoffUsuario();
    }).catchError((error) {
      setState(() {
        _mensagemErro = "Erro ao cadastrar usuário";
      });
    });
  }

  _validarCampos() {
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty) {
          setState(() {
            _mensagemErro = "";
          });
          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;
          _cadastrarUsuario(usuario);
        } else {
          setState(() {
            _mensagemErro = "Preencha a senha";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Utilize um e-mail válido";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o Nome";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backlogin1.png"),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.only(top: 80, left: 32, right: 32, bottom: 32),
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Image.asset("assets/logo.png", height: 60,),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("SE DIFERENCIE", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("adquira novas competências, habilidades e conquiste seu primeiro emprego", textAlign: TextAlign.center,style: TextStyle(fontSize: 16, color: Colors.white),),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      cursorColor: Colors.deepPurple,
                      controller: _controllerNome,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      focusNode: _nodeNome,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.deepPurple,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "Nome",
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.blueGrey),
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
                      cursorColor: Colors.deepPurple,
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      focusNode: _nodeEmail,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(_nodeNome);
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.deepPurple,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "E-mail",
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
                      cursorColor: Colors.deepPurple,
                      controller: _controllerSenha,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      focusNode: _nodeSenha,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.deepPurple,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "Senha",
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2A5C5B),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),

                    child: Theme(
                      data: ThemeData(unselectedWidgetColor: Colors.white),
                      child: CheckboxListTile(
                        checkColor: Colors.white,
                        activeColor: Colors.deepPurple,
                        title: Text(
                          "Aceite os Termos de uso e Politicas de privacidade", style: TextStyle(color: Colors.white, fontSize: 15),),
                        value: _contrato,
                        onChanged: (_contratonovo) {
                          setState(() {
                            _contrato = _contratonovo;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    )
                  ),
                  Container(
                    height: 45,
                    width: 220,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        onPressed: () {
                          _validarCampos();
                          return showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return AlertDialog(
                                  title:
                                  Text("Dados Cadastrados com Sucesso!"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Text(
                          "Criar conta",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Center(
                      child: Text(
                        " - OU SE PREFERIR - ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 220,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        onPressed: () {
                          _validarCampos();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/google_logo.png"),
                              height: 18,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Entrar com o Google",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Tem uma conta? Entre aqui",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    _mensagemErro,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

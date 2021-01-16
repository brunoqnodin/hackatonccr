import 'package:flutter/material.dart';
import 'package:prisma/Pages/ResetPassword.dart';
import 'package:prisma/Pages/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prisma/Pages/bloc/bloc.login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prisma/Pages/ui/clipper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _logarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      Navigator.pushReplacementNamed(context, "/home");
    }).catchError((error) {
      setState(() {
        mensagemErro = "Erro ao autenticar usuário, verifique e-mail e senha";
      });
    });
  }

  _validarCampos() {
    String email = controllerEmail.text;
    String senha = controllerSenha.text;
    if (email.isNotEmpty && email.contains("@")) {
      if (senha.isNotEmpty) {
        setState(() {
          mensagemErro = "";
        });
        Usuario usuario = Usuario();
        usuario.email = email;
        usuario.senha = senha;
        _logarUsuario(usuario);
      } else {
        setState(() {
          mensagemErro = "Preencha a senha";
        });
      }
    } else {
      setState(() {
        mensagemErro = "Utilize um e-mail válido";
      });
    }
  }

  Future _verificarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    if (usuarioLogado != null) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {}
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backlogin1.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 25, 30, 0),
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Image.asset("assets/logo.png", height: 60),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 30),
                  child: Center(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/cadLogin");
                      },
                      child: Text(
                        "Novo por aqui? Cadastre-se",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.deepPurple,
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.account_circle, color: Colors.deepPurple,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black54
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.deepPurple,
                  controller: controllerSenha,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.lock, color: Colors.deepPurple,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Senha",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black54
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
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
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                  },
                  child: Text(
                    "Esqueci minha senha",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Center(
                    child: Text(" - OU SE PREFERIR - ", style: TextStyle(color: Colors.white),),
                  ),
                ),
                Container(
                  height: 50,
                  width: 260,
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
                          Image(image: AssetImage("assets/google_logo.png"), height: 20,),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Entrar com o Google",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Center(
                  child: Text(
                    mensagemErro,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

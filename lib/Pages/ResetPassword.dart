import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  @override
  TextEditingController _controllerEmail = TextEditingController();
  Future<void> resetPassword(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(32),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backlogin1.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset("assets/logo.png"),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Esqueceu sua senha?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Big Shoulders Display"
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Por favor, informe o e-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração de sua senha.",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                        fontFamily: "Big Shoulders Display"
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:50, bottom: 50),
                  child: TextFormField(
                    cursorColor: Colors.deepPurple,
                    controller: _controllerEmail,
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
                        resetPassword(_controllerEmail.text);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Enviar",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
              ],
            ),
          )
      ),
    );
  }
}

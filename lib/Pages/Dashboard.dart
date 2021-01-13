import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xFFFFCF2D),
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "SEJA BEM-VINDA",
                  style: TextStyle(color: Color(0xFF5F5775), fontSize: 22),
                ),
                Text(
                  "ANA LUÍZA",
                  style: TextStyle(
                      color: Color(0xFF5F5775),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Trilhas",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFF5F5775),
                      decoration: TextDecoration.underline),
                ),
                Text(
                  "Vagas",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFF5F5775),
                      decoration: TextDecoration.underline),
                ),
                Text(
                  "Preferidos",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFF5F5775),
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF5F5775),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          "10",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "Novas vagas foram publicadas desde a sua ultima visita",
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF5F5775),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Você ganhou o trofreu 'O meu primeiro trabalho'             ",
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF5F5775),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.chat,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Você recebeu 1 novo contato da empresa QUICKO        ",
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                Text(
                  "TRILHAS ",
                  style: TextStyle(fontSize: 18, color: Color(0xFFFF5F5775)),
                ),
                Text(
                  "EM ANDAMENTO",
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
                              onPressed: () {},
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
                  "SUAS ",
                  style: TextStyle(fontSize: 18, color: Color(0xFFFF5F5775)),
                ),
                Text(
                  "APLICAÇÕES",
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
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      child: Column(
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
                            percent: 0.4,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
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
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      child: Column(
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
                            percent: 0.6,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
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
                            percent: 0.1,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "SEUS ",
                  style: TextStyle(fontSize: 18, color: Color(0xFFFF5F5775)),
                ),
                Text(
                  "PREFERIDOS",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFF5F5775),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 30),
            alignment: Alignment.centerRight,
            child: Text("Veja as ultimas vagas que você aplicou", style: TextStyle(fontSize: 14, color: Color(0xFFFF5F5775))),
          ),
          Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      child: Column(
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
                            percent: 0.4,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
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
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      child: Column(
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
                            percent: 0.6,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
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
                            percent: 0.1,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

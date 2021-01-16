import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Empresas extends StatefulWidget {
  @override
  _EmpresasState createState() => _EmpresasState();
}

class _EmpresasState extends State<Empresas> {
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.white70,
                child: Image.asset("assets/code4you.png"),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      "Code 4You",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2 trilhas / 2 vagas",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SmoothStarRating(
                        rating: rating,
                        isReadOnly: false,
                        size: 25,
                        color: Colors.amber,
                        borderColor: Colors.amber,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: false,
                        spacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            "FAÇA PARTE DO NOSSO TIME!",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Text('''
          A nossa paixão na Code 4you é facilitar a rotina das pessoas, tornando seus sites mais convenientes, utilizando inteligência e tecnologia. 
          
          Venha fazer parte da startup que mais cresce na região.
          ''', style: TextStyle(fontSize: 20), textAlign: TextAlign.start,),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Divider(color: Colors.black,),
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
                              "Code 4You",
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
                          child: Image.asset("assets/code4you.png"),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 5),
                            width: 150,
                            child: Text(
                              "Code 4You",
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
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetalheCurso extends StatefulWidget {
  @override
  _DetalheCursoState createState() => _DetalheCursoState();
}

class _DetalheCursoState extends State<DetalheCurso> {
  var rating = 3.0;
  @override
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '_I6MDBsuHhg',
    flags: YoutubePlayerFlags(
      mute: false,
      autoPlay: false,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
      enableCaption: true,
    ),
  );

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Como ingressar no mercado de trabalho?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    "COMO FAZER UM CURRÍCULO VITAE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Center(
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.deepPurple,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30, top: 15, right: 30, bottom: 20),
              child: LinearPercentIndicator(
                width: 310,
                lineHeight: 10,
                percent: 0.3,
                backgroundColor: Colors.grey,
                progressColor: Color(0xFF5F5775),
                trailing: Text("30%"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Text(
                "Você já completou 30% do curso",
                style: TextStyle(color: Color(0xFF5F5775)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Gostou do conteúdo?",
                  style: TextStyle(color: Color(0xFF5F5775), fontSize: 18),
                ),
                SmoothStarRating(
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
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Divider(),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Transcrição", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF5F5775)),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('''
Quando se trata de fazer um currículo para o primeiro emprego, muitos candidatos ficam com dúvida de como torna-lo atrativo mesmo com pouca – ou nenhuma – experiência. 

Por isso, trouxemos dicas hoje de como fazer um bom currículo mesmo que você esteja procurando a primeira oportunidade profissional da sua carreira.
                  ''', style: TextStyle(color: Colors.black54),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

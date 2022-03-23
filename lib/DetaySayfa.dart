
import 'package:flutter/material.dart';
import 'package:untitled2/filmler.dart';

class DetaySayfa extends StatefulWidget {
filmler film;


DetaySayfa({required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
              Image.asset("images/${widget.film.film_resim}", width: 300,),
            Text(widget.film.film_ad,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Text(widget.film.yonetmen.yonetmen_ad,style: TextStyle(fontSize: 40)),
            Text(widget.film.film_yil.toString(),style: TextStyle(fontSize: 35, color: Colors.pink),),

          ],
        ),
      ),

    );
  }
}


import 'package:flutter/material.dart';
import 'package:untitled2/filmler.dart';
import 'package:untitled2/filmlerdao.dart';
import 'package:untitled2/kategoriler.dart';
import 'package:untitled2/yonetmenler.dart';

import 'DetaySayfa.dart';

class FilmlerSayfa extends StatefulWidget {
 kategoriler kategori;

 FilmlerSayfa({required this.kategori});

 Future<List<filmler>> filmleriGoster(kategoriler kategori) async
 {
   print('filmler kategori id: ${kategori.kategori_id}');
    /*
    var filmlerListesi = <filmler>[];

   var k1 = kategoriler(1,kategori.kategori_ad);
   var y1 = yonetmenler(1,"quentin tarantino");
   var f1 = filmler(1,"braveheart",2000 , "braveheart.jpg", k1, y1);

    filmlerListesi.add(f1);

   var k2 = kategoriler(1,kategori.kategori_ad);
   var y2 = yonetmenler(1,"roman polanski");
   var f2 = filmler(1,"fightclub",2000 , "fightclub.jpg", k2, y2);

   filmlerListesi.add(f2);

   var k3 = kategoriler(1,kategori.kategori_ad);
   var y3 = yonetmenler(1,"steven spilberg");
   var f3 = filmler(1,"Darkknight",2000 , "darknight.jpg", k3, y3);

   filmlerListesi.add(f3);

    */
   var filmlerListesi = await filmlerdao().tumFilmler(kategori.kategori_id);
   return filmlerListesi;
 }

  @override
  State<FilmlerSayfa> createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler: "),
      ),
      body: FutureBuilder<List<filmler>>(
        future: widget.filmleriGoster(widget.kategori),
        builder: (context,snaphot)
        {

          if(snaphot.hasData)
          {
            var filmlerListesi = snaphot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5
              ),
                itemCount:filmlerListesi!.length,
                itemBuilder: (context,indeks)
                {
                  var filmler = filmlerListesi[indeks];
                  return GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: filmler)));
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("images/${filmler.film_resim}"),
                            Text(filmler.film_ad,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Text(filmler.film_yil.toString(), style: TextStyle(fontSize: 16,color: Colors.blue)),
                            // Text(kelime.ingilizce, style: TextStyle(fontWeight: FontWeight.bold),),
                            //Text(kategori.kategori_ad),

                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          else return Center();
        },

      ),

    );
  }
}

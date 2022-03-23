import 'package:flutter/material.dart';
import 'package:untitled2/kategoriler.dart';
import 'package:untitled2/kategorilerdao.dart';

import 'Filmlersayfa.dart';
import 'filmler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future <List<kategoriler>> tumKategorileriGoster() async
  {
    /*
      var kategoriListesi = <kategoriler> [];
    kategoriListesi.add(kategoriler(1,"Korku"));
    kategoriListesi.add(kategoriler(2,"Gerilim"));
    kategoriListesi.add(kategoriler(4,"Romantizm"));
     */

    var kategoriListesi = await kategorilerdao().kategoriGoster();

    return kategoriListesi;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
      ),
      body: FutureBuilder<List<kategoriler>>(
        future: tumKategorileriGoster(),
        builder: (context,snaphot)
        {

          if(snaphot.hasData)
          {
            var kategoriListesi = snaphot.data;
            return ListView.builder(
                itemCount:kategoriListesi!.length,
                itemBuilder: (context,indeks)
                {
                  var kategori = kategoriListesi[indeks];
                  return GestureDetector(
                    onTap: ()
                    {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => FilmlerSayfa(kategori: kategori)));
                    },
                    child: SizedBox(
                      height: 60,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                           // Text(kelime.ingilizce, style: TextStyle(fontWeight: FontWeight.bold),),
                           Text(kategori.kategori_ad),

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

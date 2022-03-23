import 'package:untitled2/filmler.dart';
import 'package:untitled2/kategoriler.dart';
import 'package:untitled2/yonetmenler.dart';


import 'VeritabaniYardimcisi.dart';


class filmlerdao
{

  Future <List<filmler>> tumFilmler (int kategori_id) async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler, kategoriler, yonetmenler "
        "WHERE filmler.kategori_id = $kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = kategoriler.kategori_id");
    //   "and filmler.kategori_id = katrgoriler.kategori_id");
    print('filmler.kategori_id = $kategori_id');

    //  "WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen.id"
      //  "and filmler.kategori_id = $kategori_id");



    return List.generate(maps.length, (index){
      var satir = maps[index];
      var k1 = kategoriler(satir["kategori_id"],satir["kategori_ad"]);
      var y1 = yonetmenler(satir["yonetmen_id"],satir["yonetmen_ad"]);
      return filmler(satir["film_id"],satir["film_ad"] , satir["film_yil"], satir["film_resim"],k1,y1);
    });
  }





}


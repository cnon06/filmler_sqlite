import 'package:untitled2/filmler.dart';
import 'package:untitled2/kategoriler.dart';


import 'VeritabaniYardimcisi.dart';


class kategorilerdao
{

  Future <List<kategoriler>> kategoriGoster () async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kategoriler");

    return List.generate(maps.length, (index){
      var satir = maps[index];
      return kategoriler(satir["kategori_id"],satir["kategori_ad"]);
    });
  }





}


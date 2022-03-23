import 'kategoriler.dart';
import 'yonetmenler.dart';

class filmler
{
  int film_id;
  String film_ad;
  int film_yil;
  String film_resim;
  // int kategori_id;
  // int yonetmen_id;

  yonetmenler yonetmen;
  kategoriler kategori;

  filmler(this.film_id, this.film_ad, this.film_yil, this.film_resim,
      this.kategori, this.yonetmen);
}
import 'package:odev7/data/entity/to_do.dart';
import 'package:odev7/sqlite/veritabani_yardimcisi.dart';

class ToDoDaoRepository{
  Future<void> kaydet(String name) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniYapilacak = Map<String, dynamic>();
    yeniYapilacak["name"] = name;

    await db.insert("toDos", yeniYapilacak);
  }

  Future<void> guncelle(int id, String name) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var guncellenenYapilacak = Map<String, dynamic>();
    guncellenenYapilacak["name"] = name;

    await db.update("toDos", guncellenenYapilacak,where: "id = ?", whereArgs: [id]);

    // await db.update("kisiler", guncellenenYapilacak,where: "kisi_id = ? and ?", whereArgs: [kisi_id, kisi_ad]);
    //bu da bir yöntem
  }

  Future<List<ToDos>> yapilacaklariYukle() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> satirlar = await db.rawQuery("SELECT * FROM toDos"); //bu da db'den verileri getirirken her bir satıra erişiyoruz.

    return List.generate(satirlar.length, (index){ //liste üretmek için
      var satir = satirlar[index];
      var id = satir["id"];
      var name = satir["name"];

      return ToDos(id: id, name: name);
    });
  }

  Future<List<ToDos>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> satirlar = await db.rawQuery("SELECT * FROM toDos WHERE name like '%$aramaKelimesi%'"); //bu da db'den verileri getirirken her bir satıra erişiyoruz.

    return List.generate(satirlar.length, (index){ //liste üretmek için
      var satir = satirlar[index];
      var id = satir["id"];
      var name = satir["name"];

      return ToDos(id: id, name: name);
    });
  }

  Future<void> sil(int id) async{ //silme işlemi ayrı çalışır ve işlemini yapar.
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("toDos", where: "id = ?", whereArgs: [id]);
  }
}
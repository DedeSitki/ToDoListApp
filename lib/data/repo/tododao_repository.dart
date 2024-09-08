import 'package:to_do_app/sqlite/veritani_yardimcisi.dart';
import '../entity/todos.dart';

//DAO database access object
class ToDoRepository {
  Future<void> kaydet(String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniToDo = Map<String, dynamic>();
    yeniToDo["name"] = name;
    await db.insert("toDo", yeniToDo);
  }

  Future<void> guncelle(int id, String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenToDo = Map<String, dynamic>();
    guncellenenToDo["name"] = name;
    await db.update("toDo", guncellenenToDo, where: "id=?", whereArgs: [id]);
  }

  Future<List<ToDos>> toDosYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    //dynamic belli değil int string olabilir.
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM toDo");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      var id = satir["id"];
      var name = satir["name"];
      return ToDos(id: id, name: name);
    });
  }

  Future<List<ToDos>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM toDo WHERE NAME LIKE '$aramaKelimesi%'");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      var id = satir["id"];
      var name = satir["name"];
      return ToDos(id: id, name: name);
    });
  }

  Future<void> sil(int id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("toDo", where: "id = ?", whereArgs: [id]);
  }
}

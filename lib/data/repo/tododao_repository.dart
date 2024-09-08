import 'package:flutter/foundation.dart';
import '../entity/todos.dart';

//DAO database access object
class ToDoRepository {
  Future<void> kaydet(String name) async {
    if (kDebugMode) {
      print("kaydedildi : $name");
    }
  }

  Future<void> guncelle(int id, String name) async {
    if (kDebugMode) {
      print("Güncelle : $id - $name");
    }
  }

  Future<List<ToDos>> toDosYukle() async {
    var toDosListesi = <ToDos>[];
    var toDo1 = ToDos(id: 1, name: "Spor");
    var toDo2 = ToDos(id: 2, name: "Yemek");
    var toDo3 = ToDos(id: 3, name: "Alişveriş");
    toDosListesi.add(toDo1);
    toDosListesi.add(toDo2);
    toDosListesi.add(toDo3);
    return toDosListesi;
  }

  Future<List<ToDos>> ara(String aramaKelimesi) async {
    var toDosListesi = <ToDos>[];
    var toDo1 = ToDos(id: 1, name: "Spor");
    toDosListesi.add(toDo1);

    return toDosListesi;
  }

  Future<void> sil(int id) async {
    print("Sil : $id");
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:to_do_app/ui/renkler.dart';
import 'package:to_do_app/ui/views/detay_sayfa.dart';
import 'package:to_do_app/ui/views/kay%C4%B1t_sayfa.dart';
import '../../data/entity/todos.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<void> ara(String aramaKelimesi) async {
    print("Ara : $aramaKelimesi");
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

  Future<void> sil(int id) async {
    print("Sil : $id");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDos",
          style:
              TextStyle(color: yaziRenk1, fontFamily: 'Pacifico', fontSize: 30),
        ),
        backgroundColor: renk3,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Grock.to(const KayitSayfa());
        },
        backgroundColor: renk3,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoSearchTextField(
                onChanged: (searchText) {
                  ara(searchText);
                },
              ),
            ),
            FutureBuilder<List<ToDos>>(
              future: toDosYukle(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var toDosListesi = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: toDosListesi!.length,
                      itemBuilder: (context, index) {
                        var toDo = toDosListesi[index];
                        return GestureDetector(
                          onTap: () {
                            Grock.to(DetaySayfa(toDos: toDo));
                          },
                          child: Card(
                              child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  toDo.name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: renk1,
                                      content: Text(
                                        "${toDo.name} silinsin mi ?",
                                        style: TextStyle(color: yaziRenk1),
                                      ),
                                      action: SnackBarAction(
                                        label: "Evet",
                                        textColor: yaziRenk1,
                                        onPressed: () {
                                          sil(toDo.id);
                                        },
                                      ),
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    color: renk1,
                                  ))
                            ],
                          )),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

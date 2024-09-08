import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/cubit/detay_sayfa_cubit.dart';
import 'package:to_do_app/ui/renkler.dart';
import '../../data/entity/todos.dart';

class DetaySayfa extends StatefulWidget {
  ToDos toDos;

  DetaySayfa({super.key, required this.toDos});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfName = TextEditingController();

  @override
  void initState() {
    super.initState();
    var toDo = widget.toDos;
    tfName.text = toDo.name;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detay Sayfa",
          style:
              TextStyle(fontFamily: "Pacifico", fontSize: 30, color: yaziRenk1),
        ),
        backgroundColor: renk3,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                controller: tfName,
                decoration:
                    const InputDecoration(hintText: "Yapılacak Giriniz..."),
              ),
            ),
            // Text("${widget.toDos.id} - ${widget.toDos.name}")
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  context.read<DetaySayfaCubit>().guncelle(widget.toDos.id, tfName.text);
                },
                style: ElevatedButton.styleFrom(backgroundColor: renk3),
                child: Text(
                  "Güncelle",
                  style: TextStyle(color: yaziRenk1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

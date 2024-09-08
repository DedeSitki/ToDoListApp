import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/cubit/kayit_sayfa_cubit.dart';
import 'package:to_do_app/ui/renkler.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kayıt Sayfa",
          style:
              TextStyle(color: yaziRenk1, fontFamily: 'Pacifico', fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: renk3,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: tfname,
                decoration: const InputDecoration(
                  hintText: "Yapılacakları Giriniz...",
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  context.read<KayitSayfaCubit>().kaydet(tfname.text);
                },
                style: ElevatedButton.styleFrom(backgroundColor: renk3),
                child: Text(
                  "KAYDET",
                  style: TextStyle(color: yaziRenk1, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

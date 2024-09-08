//DAO database access object
import 'package:flutter/foundation.dart';

class ToDoRepository{

  Future<void> kaydet(String name)async {
    if (kDebugMode) {
      print("kaydedildi : $name");
    }
  }
}
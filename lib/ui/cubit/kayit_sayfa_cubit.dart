import '../../data/repo/tdodao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit() : super(0);
  var toDoRepo = ToDoRepository();

  Future<void> kaydet(String name)async {
   await toDoRepo.kaydet(name);
  }
}
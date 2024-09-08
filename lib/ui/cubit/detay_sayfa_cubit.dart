import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/tododao_repository.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit() : super(0);
  var toDoRepo = ToDoRepository();

  Future<void> guncelle(int id, String name) async {
    await toDoRepo.guncelle(id, name);
  }

}
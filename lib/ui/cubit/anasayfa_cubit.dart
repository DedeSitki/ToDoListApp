import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/tdodao_repository.dart';

class AnasayfaCubit extends Cubit<void>{
  AnasayfaCubit() : super(0);
  var toDoRepo = ToDoRepository();


}
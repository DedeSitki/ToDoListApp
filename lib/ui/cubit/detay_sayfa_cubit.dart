import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/tdodao_repository.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit() : super(0);
  var toDoRepo = ToDoRepository();



}
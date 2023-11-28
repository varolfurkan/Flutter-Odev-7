import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/repo/to_do_dao_repository.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit():super(0);

  var krepo = ToDoDaoRepository();

  Future<void> guncelle(int id, String name) async{
    await krepo.guncelle(id, name);
  }
}






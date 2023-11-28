import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/entity/to_do.dart';
import 'package:odev7/data/repo/to_do_dao_repository.dart';

class AnasayfaCubit extends Cubit<List<ToDos>> {
  AnasayfaCubit():super(<ToDos>[]);

  var krepo = ToDoDaoRepository();

  Future<void> yapilacaklariYukle() async{
    var liste = await krepo.yapilacaklariYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await krepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int id) async{
    await krepo.sil(id);
    yapilacaklariYukle();
  }
}






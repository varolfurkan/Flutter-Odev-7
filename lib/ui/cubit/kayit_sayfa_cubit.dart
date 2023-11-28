import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/repo/to_do_dao_repository.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit():super(0);

  var krepo = ToDoDaoRepository();
  Future<void> kaydet(String name) async{
    await krepo.kaydet(name);
  }
}






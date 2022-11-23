import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:persons_with_bloc/repo/personsDAO_repo.dart';

class PersonDetailCubit extends Cubit<void> {
  PersonDetailCubit() : super(0);

  var prepo = PersonsDaoRepository();

  Future<void> update(int id, String name, String phone) async {
    await prepo.personUpdate(id, name, phone);
  }
}

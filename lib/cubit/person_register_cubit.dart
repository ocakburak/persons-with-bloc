import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:persons_with_bloc/repo/personsDAO_repo.dart';

class PersonRegisterCubit extends Cubit<void> {
  PersonRegisterCubit() : super(0);

  var prepo = PersonsDaoRepository();

  Future<void> register(String name, String phone) async {
    await prepo.personRegister(name, phone);
  }
}

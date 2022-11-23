import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:persons_with_bloc/entity/persons.dart';
import 'package:persons_with_bloc/repo/personsDAO_repo.dart';

class HomePageCubit extends Cubit<List<Persons>> {
  HomePageCubit() : super(<Persons>[]);

  var prepo = PersonsDaoRepository();

  Future<void> showAllPerson() async {
    var personList = await prepo.getAllPerson();
    emit(personList);
  }

  Future<void> search(String searchWord) async {
    var personList = await prepo.searchPerson(searchWord);
    emit(personList);
  }

  Future<void> delete(int id) async {
    await prepo.personDelete(id);
    await showAllPerson();
  }
}

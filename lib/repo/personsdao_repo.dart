import 'package:persons_with_bloc/entity/persons.dart';

class PersonsDaoRepository {
  Future<void> personRegister(String name, String phone) async {
    print("register: $name - $phone");
  }

  Future<void> personUpdate(int id, String name, String phone) async {
    print("update: $id - $name - $phone");
  }

  Future<List<Persons>> getAllPerson() async {
    var personList = <Persons>[];
    var p1 = Persons(person_id: 1, person_name: 'Uraz', person_phone: '1903');
    var p2 = Persons(person_id: 2, person_name: 'Atiba', person_phone: '39');
    var p3 = Persons(person_id: 3, person_name: 'Leo', person_phone: '10');

    personList.add(p1);
    personList.add(p2);
    personList.add(p3);

    return personList;
  }

  Future<List<Persons>> searchPerson(String searchWord) async {
    var personList = <Persons>[];
    var p1 = Persons(person_id: 1, person_name: 'Uraz', person_phone: '1903');

    personList.add(p1);

    return personList;
  }

  Future<void> personDelete(int id) async {
    print("delete: $id");
  }
}

import 'package:persons_with_bloc/entity/persons.dart';
import 'package:persons_with_bloc/sqlite/database_help.dart';

class PersonsDaoRepository {
  Future<void> personRegister(String name, String phone) async {
    print("register: $name - $phone");
  }

  Future<void> personUpdate(int id, String name, String phone) async {
    print("update: $id - $name - $phone");
  }

  Future<List<Persons>> getAllPerson() async {
    var db = await DatabaseHelp.databaseConnect();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM PERSONS");

    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Persons(
        person_id: row['person_id'],
        person_name: row['person_name'],
        person_phone: row['person_phone'],
      );
    });

    // var personList = <Persons>[];
    // var p1 = Persons(person_id: 1, person_name: 'Uraz', person_phone: '1903');
    // var p2 = Persons(person_id: 2, person_name: 'Atiba', person_phone: '39');
    // var p3 = Persons(person_id: 3, person_name: 'Leo', person_phone: '10');

    // personList.add(p1);
    // personList.add(p2);
    // personList.add(p3);

    // return personList;
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

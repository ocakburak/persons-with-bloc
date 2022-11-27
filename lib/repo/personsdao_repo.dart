import 'package:persons_with_bloc/entity/persons.dart';
import 'package:persons_with_bloc/sqlite/database_help.dart';

class PersonsDaoRepository {
  Future<void> personRegister(String name, String phone) async {
    var db = await DatabaseHelp.databaseConnect();
    var info = Map<String, dynamic>();
    info["person_name"] = name;
    info["person_phone"] = phone;

    await db.insert("persons", info);
  }

  Future<void> personUpdate(int id, String name, String phone) async {
    var db = await DatabaseHelp.databaseConnect();
    var info = Map<String, dynamic>();
    info["person_name"] = name;
    info["person_phone"] = phone;

    await db.update("persons", info, where: "person_id=?", whereArgs: [id] );
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
  }

  Future<List<Persons>> searchPerson(String searchWord) async {
    var db = await DatabaseHelp.databaseConnect();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM PERSONS WHERE person_name like '%$searchWord%'");

    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Persons(
        person_id: row['person_id'],
        person_name: row['person_name'],
        person_phone: row['person_phone'],
      );
    });
  }

  Future<void> personDelete(int id) async {
    var db = await DatabaseHelp.databaseConnect();
    await db.delete("persons", where: "person_id=?", whereArgs: [id]);
  }
}

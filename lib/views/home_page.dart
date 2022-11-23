import 'package:flutter/material.dart';
import 'package:persons_with_bloc/entity/persons.dart';
import 'package:persons_with_bloc/views/person_detail_page.dart';

import 'package:persons_with_bloc/views/person_register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  Future<List<Persons>> showAllPerson() async {
    var personList = <Persons>[];
    var p1 = Persons(person_id: 1, person_name: 'Uraz', person_phone: '1903');
    var p2 = Persons(person_id: 2, person_name: 'Atiba', person_phone: '39');
    var p3 = Persons(person_id: 3, person_name: 'Leo', person_phone: '10');

    personList.add(p1);
    personList.add(p2);
    personList.add(p3);

    return personList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: 'Search'),
                onChanged: (result) {
                  print('Result: $result');
                },
              )
            : const Text('Persons'),
        actions: [
          isSearch
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearch = !isSearch;
                    });
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearch = !isSearch;
                    });
                  },
                ),
        ],
      ),
      body: FutureBuilder<List<Persons>>(
        future: showAllPerson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var personLists = snapshot.data;
            return ListView.builder(
              itemCount: personLists!.length,
              itemBuilder: (BuildContext context, int index) {
                var per = personLists[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonDetailPage(person: per),
                      ),
                    ).then((value) {
                      print("back to home page");
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('${per.person_name} - ${per.person_phone}'),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('${per.person_name} is delete?'),
                                action: SnackBarAction(
                                  label: 'YES',
                                  onPressed: () {
                                    print('Person delete: ${per.person_id}');
                                  },
                                ),
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PersonRegisterPage(),
            ),
          ).then((value) {
            print("back to home page");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

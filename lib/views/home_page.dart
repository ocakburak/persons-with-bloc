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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
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

          // var person = Persons(
          //     person_id: 1, person_name: 'Burak', person_phone: '12345');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => PersonDetailPage(person: person),
          //   ),
          // ).then((value) {
          //   print("back to home page");
          // });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

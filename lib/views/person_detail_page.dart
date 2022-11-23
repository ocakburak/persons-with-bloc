import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:persons_with_bloc/entity/persons.dart';

import '../cubit/person_detail_cubit.dart';

class PersonDetailPage extends StatefulWidget {
  Persons person;

  PersonDetailPage({required this.person});

  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
  var personName = TextEditingController();
  var personPhone = TextEditingController();

  @override
  void initState() {
    super.initState();
    var person = widget.person;
    personName.text = person.person_name;
    personPhone.text = person.person_phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Detail'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: personName,
                decoration: const InputDecoration(hintText: 'Person Name'),
              ),
              TextField(
                controller: personPhone,
                decoration: const InputDecoration(hintText: 'Person Phone'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<PersonDetailCubit>().update(
                      widget.person.person_id,
                      personName.text,
                      personPhone.text);
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

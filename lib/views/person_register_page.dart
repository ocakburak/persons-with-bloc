import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_with_bloc/cubit/person_register_cubit.dart';

class PersonRegisterPage extends StatefulWidget {
  const PersonRegisterPage({super.key});

  @override
  State<PersonRegisterPage> createState() => _PersonRegisterPageState();
}

class _PersonRegisterPageState extends State<PersonRegisterPage> {
  var personName = TextEditingController();
  var personPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Register'),
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
                  context
                      .read<PersonRegisterCubit>()
                      .register(personName.text, personPhone.text);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PersonRegisterPage extends StatefulWidget {
  const PersonRegisterPage({super.key});

  @override
  State<PersonRegisterPage> createState() => _PersonRegisterPageState();
}

class _PersonRegisterPageState extends State<PersonRegisterPage> {
  var personName = TextEditingController();
  var personPhone = TextEditingController();

  Future<void> register(String name, String phone) async {
    print("register: $name - $phone");
  }

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
              TextField(controller: personName, decoration: const InputDecoration(hintText: 'Person Name'),),
              TextField(controller: personPhone, decoration: const InputDecoration(hintText: 'Person Phone'),),
              ElevatedButton(
                onPressed: () {
                  register(personName.text, personPhone.text);
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

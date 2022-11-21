import 'package:flutter/material.dart';

class PersonRegisterPage extends StatefulWidget {
  const PersonRegisterPage({super.key});

  @override
  State<PersonRegisterPage> createState() => _PersonRegisterPageState();
}

class _PersonRegisterPageState extends State<PersonRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
          ],
        ),
      ),
    );
  }
}
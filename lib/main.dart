import 'package:flutter/material.dart';
import 'cubit/person_detail_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_with_bloc/cubit/person_register_cubit.dart';
import 'package:persons_with_bloc/views/home_page.dart';
import 'package:persons_with_bloc/cubit/home_page_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PersonRegisterCubit()),
        BlocProvider(create: (context) => PersonDetailCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

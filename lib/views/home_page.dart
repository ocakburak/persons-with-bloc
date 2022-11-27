import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:persons_with_bloc/cubit/home_page_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().showAllPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: 'Search'),
                onChanged: (result) {
                  context.read<HomePageCubit>().search(result);
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
                      context.read<HomePageCubit>().showAllPerson();
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
      body: BlocBuilder<HomePageCubit, List<Persons>>(
        builder: (context, personList) {
          if (personList.isNotEmpty) {
            return ListView.builder(
              itemCount: personList.length,
              itemBuilder: (BuildContext context, int index) {
                var per = personList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonDetailPage(person: per),
                      ),
                    ).then((value) {
                      context.read<HomePageCubit>().showAllPerson();
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
                                    context
                                        .read<HomePageCubit>()
                                        .delete(per.person_id);
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
            context.read<HomePageCubit>().showAllPerson();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:bloc_practice/presentation/list/list_screen.dart';
import 'package:bloc_practice/repos/item_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (ctx) => ItemRepository(),
        ),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc',
      debugShowCheckedModeBanner: false,
      home: ListScreen(),
    );
  }
}

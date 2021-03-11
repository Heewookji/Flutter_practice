import 'package:bloc_practice/logic/tab/tab_cubit.dart';
import 'package:bloc_practice/presentation/tab/tab_screen.dart';
import 'package:bloc_practice/repos/item_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (ctx) => ItemRepo(),
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
      home: BlocProvider(
        create: (ctx) => TabCubit(),
        child: TabScreen(),
      ),
    );
  }
}

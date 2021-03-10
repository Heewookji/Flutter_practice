import 'package:bloc_practice/logic/list/list_bloc.dart';
import 'package:bloc_practice/presentation/list/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ListBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ListScreen(),
      ),
    );
  }
}

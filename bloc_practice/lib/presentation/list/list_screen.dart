import 'package:bloc_practice/logic/list/list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (ctx, state) => Container(),
      ),
    );
  }
}

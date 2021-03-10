import 'package:bloc_practice/logic/list/item_bloc.dart';
import 'package:bloc_practice/repos/item_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/item_list.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list'),
      ),
      body: BlocProvider(
        create: (_) => ItemBloc(itemRepo: context.read<ItemRepo>())
          ..add(ItemFetched()),
        child: ItemList(),
      ),
    );
  }
}

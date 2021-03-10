import 'package:bloc_practice/logic/list/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(builder: (ctx, state) {
      if (state is ItemFetchSuccess)
        return ListView.builder(
          itemCount: state.items.length,
          itemBuilder: (ctx, i) {
            final item = state.items[i];
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.userName),
            );
          },
        );
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

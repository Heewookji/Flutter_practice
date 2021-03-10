import 'package:bloc_practice/logic/list/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItemBloc, ItemState>(
      listener: (ctx, state) {
        print(state.hasReachedMax);
        if (state.status == ItemStatus.failure && state.items.isNotEmpty)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('새로운 데이터를 가져오지 못했습니다'),
            ),
          );
      },
      builder: (ctx, state) {
        if (state.items.isNotEmpty)
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!state.hasReachedMax &&
                  scrollInfo is ScrollEndNotification &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                context.read<ItemBloc>().add(ItemFetched());
              }
              return true;
            },
            child: _buildListView(state),
          );
        else if (state.status == ItemStatus.failure)
          return Center(child: Text('데이터를 가져오지 못했습니다.'));
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  ListView _buildListView(ItemState state) {
    return ListView.builder(
      itemCount:
          state.hasReachedMax ? state.items.length : state.items.length + 1,
      itemBuilder: (ctx, i) {
        if (i == state.items.length)
          return Center(child: CircularProgressIndicator());
        final item = state.items[i];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: ListTile(
            title: Text(item.title),
          ),
        );
      },
    );
  }
}

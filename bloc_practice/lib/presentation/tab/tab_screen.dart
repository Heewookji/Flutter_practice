import 'package:bloc_practice/logic/list/item_bloc.dart';
import 'package:bloc_practice/logic/tab/tab_cubit.dart';
import 'package:bloc_practice/presentation/list/widgets/item_list.dart';
import 'package:bloc_practice/repos/item_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, TabState>(
      builder: (ctx, state) => Scaffold(
        appBar: AppBar(),
        body: IndexedStack(
          children: [
            BlocProvider(
              create: (_) => ItemBloc(itemRepo: context.read<ItemRepo>())
                ..add(ItemFetched()),
              child: ItemList(),
            ),
            Center(
              child: Text('tabTwo'),
            ),
          ],
          index: state.status.index,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.status.index,
          onTap: context.read<TabCubit>().tabChange,
          items: [
            BottomNavigationBarItem(
              label: 'tabOne',
              icon: Icon(Icons.looks_one),
            ),
            BottomNavigationBarItem(
              label: 'tabTwo',
              icon: Icon(Icons.looks_two),
            ),
          ],
        ),
      ),
    );
  }
}

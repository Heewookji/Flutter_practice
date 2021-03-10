import 'dart:async';

import 'package:bloc_practice/repos/item_repo.dart';
import 'package:bloc_practice/repos/models/item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepo _itemRepo;
  int _maxCount = 0;

  ItemBloc({@required ItemRepo itemRepo})
      : this._itemRepo = itemRepo,
        super(ItemState());

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is ItemFetched) yield await _fetchItems();
  }

  Future<ItemState> _fetchItems() async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == ItemStatus.initial) {
        final result = await _itemRepo.fetchItems();
        _maxCount = result[ItemRepoResult.maxCount] as int;
        final items = result[ItemRepoResult.itemList] as List<Item>;
        return state.copyWith(
          status: ItemStatus.success,
          items: items,
          hasReachedMax: _hasReachedMax(items.length),
        );
      }
      final result = await _itemRepo.fetchItems(state.items.length);
      _maxCount = result[ItemRepoResult.maxCount] as int;
      final List<Item> additionalItems =
          result[ItemRepoResult.itemList] as List<Item>;
      return additionalItems.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: ItemStatus.success,
              items: [...state.items]..addAll(additionalItems),
              hasReachedMax:
                  _hasReachedMax(state.items.length + additionalItems.length),
            );
    } catch (error) {
      return state.copyWith(status: ItemStatus.failure);
    }
  }

  bool _hasReachedMax(int itemsCount) => itemsCount >= _maxCount ? true : false;
}

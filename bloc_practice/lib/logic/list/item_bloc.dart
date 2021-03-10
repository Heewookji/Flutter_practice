import 'dart:async';

import 'package:bloc_practice/repos/item_repository.dart';
import 'package:bloc_practice/repos/models/item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository _itemRepository;
  ItemBloc({@required ItemRepository itemRepository})
      : this._itemRepository = itemRepository,
        super(ItemFetchInit());

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is ItemFetched) yield await _fetchItems(state);
  }

  Future<ItemState> _fetchItems(ItemState state) async {
    ItemState ret;
    try {
      ret = ItemFetchSuccess(await _itemRepository.fetchItems());
    } catch (error) {
      ret = ItemFetchFail();
    }
    return ret;
  }
}

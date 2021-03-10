import 'dart:async';

import 'package:bloc_practice/repos/item_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ItemRepository _itemRepository;
  ListBloc({required ItemRepository itemRepository})
      : this._itemRepository = itemRepository,
        super(ListInitial());

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {}
}

part of 'item_bloc.dart';

@immutable
abstract class ItemState extends Equatable {
  @override
  List<Object> get props => [];
}

class ItemFetchInit extends ItemState {}

class ItemFetchLoading extends ItemState {}

class ItemFetchSuccess extends ItemState {
  final List<Item> items;
  ItemFetchSuccess(this.items);

  @override
  List<Object> get props => [items];
}

class ItemFetchFail extends ItemState {}

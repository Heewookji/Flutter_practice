part of 'item_bloc.dart';

enum ItemStatus { initial, success, failure }

class ItemState extends Equatable {
  final List<Item> items;
  final ItemStatus status;
  final bool hasReachedMax;

  ItemState({
    this.items = const [],
    this.status = ItemStatus.initial,
    this.hasReachedMax = false,
  });

  ItemState copyWith({
    ItemStatus status,
    List<Item> items,
    bool hasReachedMax,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [items, status, hasReachedMax];
}

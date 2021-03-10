import 'models/item.dart';

enum ItemRepoResult { maxCount, itemList }

class ItemRepo {
  static const int limit = 3;
  List<Item> _list = [
    Item('title1'),
    Item('title2'),
    Item('title3'),
    Item('title4'),
    Item('title5'),
    Item('title6'),
    Item('title7'),
    Item('title8'),
    Item('title9'),
    Item('title10'),
    Item('title11'),
    Item('title12'),
    Item('title13'),
    Item('title14'),
    Item('title15'),
    Item('title16'),
    Item('title17'),
    Item('title18'),
    Item('title19'),
    Item('title20'),
  ];

  Future<Map<ItemRepoResult, Object>> fetchItems([int offset = 0]) async {
    await Future.delayed(Duration(seconds: 1));
    return {
      ItemRepoResult.itemList: _list.sublist(offset, offset + limit),
      ItemRepoResult.maxCount: _list.length,
    };
  }
}

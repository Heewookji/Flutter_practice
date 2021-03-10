import 'models/item.dart';

class ItemRepository {
  Future<List<Item>> fetchItems() async {
    await Future.delayed(Duration(seconds: 3));
    return [
      Item('title1', 'name1', DateTime.now()),
      Item('title2', 'name2', DateTime.now()),
      Item('title3', 'name3', DateTime.now()),
    ];
  }
}

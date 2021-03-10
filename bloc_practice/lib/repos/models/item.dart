class Item {
  final String title;
  final String userName;
  final DateTime createdAt;

  Item(this.title, this.userName, this.createdAt);

  @override
  String toString() {
    return 'Item{title: $title, userName: $userName, createdAt: $createdAt}';
  }
}

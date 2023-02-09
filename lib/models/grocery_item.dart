//GroceryItem Model

class GroceryItem {
  final String name;
  final String subtitle;
  bool isDone;

  GroceryItem({
    required this.name,
    required this.subtitle,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:grocery_list/models/grocery_item.dart';

class GroceryData extends ChangeNotifier{
  final List<GroceryItem> _groceryItems = [
    GroceryItem(name: 'Buy milk', subtitle: '2 Litres'),
    GroceryItem(name: 'Buy eggs', subtitle: '1 Dozen'),
    GroceryItem(name: 'Buy cheese', subtitle: '1 Kg'),
  ];

  List<GroceryItem> get groceryItems {
    return _groceryItems;
  }

  int get groceryItemCount {
    return _groceryItems.length;
  }

  void addGroceryItem(String newGroceryTitle, String newSubtitleText) {
    final groceryItem = GroceryItem(
      name: newGroceryTitle,
      subtitle: newSubtitleText,
    );
    _groceryItems.add(groceryItem);
    notifyListeners();
  }

  void updateGroceryItem(GroceryItem groceryItem) {
    groceryItem.toggleDone();
    notifyListeners();
  }

  void removeGroceryItem(GroceryItem groceryItem) {
    _groceryItems.remove(groceryItem);
    notifyListeners();
  }
}
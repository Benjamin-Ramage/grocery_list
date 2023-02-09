import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_data.dart';
import 'package:grocery_list/widgets/grocery_item_tile.dart';
import 'package:provider/provider.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GroceryData>(
      builder: (context, taskData, child) {
        return ReorderableListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.groceryItems[index];
            return Dismissible(
              key: Key(task.name),
              onDismissed: (direction) {
                setState(() {
                  taskData.removeGroceryItem(task);
                });
              },
              child: GroceryItemTile(
                key: ValueKey(task.name),
                groceryTitle: task.name,
                subtitleText: task.subtitle,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateGroceryItem(task);
                },
                deleteCallback: (direction) {
                  taskData.removeGroceryItem(task);
                },
              ),
            );
          },
          itemCount: taskData.groceryItemCount,
          onReorder: (oldIndex, newIndex) {
            final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

            final user = taskData.groceryItems.removeAt(oldIndex);
            taskData.groceryItems.insert(index, user);
          },
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:grocery_list/theme/colours.dart';

class GroceryItemTile extends StatelessWidget {
  final bool isChecked;
  final String groceryTitle;
  final String subtitleText;
  final Function(bool?) checkboxCallback;
  final Function deleteCallback;

  const GroceryItemTile({
    required this.isChecked,
    required this.groceryTitle,
    required this.subtitleText,
    required this.checkboxCallback,
    required this.deleteCallback,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColours.backgroundColour,
      child: ListTile(
        leading: Checkbox(
          activeColor: AppColours.darkGrey,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
        title: Text(
          groceryTitle,
          style: TextStyle(
            fontSize: 20.0,
            color: AppColours.darkGrey,
            fontWeight: FontWeight.bold,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          subtitleText,
          style: Theme.of(context).textTheme.headline6,
        ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}


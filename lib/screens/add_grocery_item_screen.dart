import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_data.dart';
import 'package:grocery_list/theme/colours.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddGroceryItemScreen extends StatelessWidget {
  String newGroceryTitle = '';
  String newSubtitleText = '';

  AddGroceryItemScreen({
    required this.newGroceryTitle,
    required this.newSubtitleText,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.darkGrey,
      child: Container(
        height: 150.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 0.0),
              blurRadius: 5.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 15.0,
                    top: 20.0,
                    right: 15.0,
                    bottom: 20.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5.0,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (newText){
                            newGroceryTitle = newText;
                          },
                          maxLength: 75,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add a new grocery item'
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (subtitleText){
                            newSubtitleText = subtitleText;
                          },
                          maxLength: 35,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Notes'
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20.0,
                  right: 20.0,
                ),
                child: FloatingActionButton(
                  backgroundColor: AppColours.teal,
                  onPressed: (){
                    const text = 'Grocery item added to your list';
                    final snackBar = SnackBar(
                      duration: const Duration(seconds: 20),
                      content: const Text(text),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: (){},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Provider.of<GroceryData>(context, listen: false).addGroceryItem(newGroceryTitle, newSubtitleText);
                    Navigator.pop(context);
                  },
                    child: const Icon(FontAwesomeIcons.plus),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

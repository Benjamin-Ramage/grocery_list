import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_list/models/grocery_data.dart';
import 'package:grocery_list/screens/add_grocery_item_screen.dart';
import 'package:grocery_list/theme/colours.dart';
import 'package:grocery_list/widgets/grocery_list.dart';
import 'package:provider/provider.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({Key? key}) : super(key: key);

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColour,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 60.0,
            child: ClipOval(child: Image.asset('images/avataar_ben.png')),
          ),
          Positioned(
            top: 365.0,
            child: Text(
              "Ben's Grocery List",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Positioned(
            top: 415.0,
            child: Text(
              '${Provider.of<GroceryData>(context).groceryItemCount} Grocery Items',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Positioned(
            width: (MediaQuery.of(context).size.width),
            top: 450.0,
            bottom: 0,
            child: const GroceryList(),
          ),
          Positioned(
            top: 815.0,
            left: 335.0,
            child: FloatingActionButton(
              backgroundColor: AppColours.teal,
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: AddGroceryItemScreen(
                        newGroceryTitle: '',
                        newSubtitleText: '',
                      ),
                    ),
                  ),
                );
              },
              child: const Icon(FontAwesomeIcons.plus),
            ),
          ),
        ],
      ),
    );
  }
}
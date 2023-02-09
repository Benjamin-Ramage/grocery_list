import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_data.dart';
import 'package:grocery_list/screens/grocery_list_screen.dart';
import 'package:grocery_list/theme/bens_theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = BensTheme.light();
    return ChangeNotifierProvider(
      create: (context) => GroceryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ben's Grocery List",
        theme: theme,
        home: const GroceryListScreen(),
      ),
    );
  }
}
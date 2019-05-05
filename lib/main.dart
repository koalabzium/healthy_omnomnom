import 'package:flutter/material.dart';
import './recipe_details_view.dart';
import './recipe.dart';
import './loading_view.dart';
import './recipe_list_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Omnomnom',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Recipe recipe = Recipe("assets/balony.jpg", "name", "type", ["a", "b", "a", "b", "a", "b"],
      "description", ["c", "d", "e"], true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(recipe.name),
      ),
//      body: RecipeDetails(recipe)
    body: RecipeList(),
      );
  }
}

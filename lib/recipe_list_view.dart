import 'package:flutter/material.dart';

import './recipe.dart';

class RecipeList extends StatelessWidget {
//  final List<Recipe> recipes;

  final List<Recipe> breakfasts = [Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name2", "type2", ["b", "c"], "description2", ["d", "e"], false), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true)];
  final List<Recipe> dinners = [Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name2", "type2", ["b", "c"], "description2", ["d", "e"], false), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true)];
  final List<Recipe> desserts = [Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name2", "type2", ["b", "c"], "description2", ["d", "e"], false), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true)];
  final List<Recipe> smoothies = [Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name2", "type2", ["b", "c"], "description2", ["d", "e"], false), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true)];
  final List<Recipe> owsianki = [Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name2", "type2", ["b", "c"], "description2", ["d", "e"], false), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true), Recipe("assets/balony.jpg", "name", "type", ["b", "c"], "description", ["d", "e"], true)];


//  RecipeList(this.breakfasts, this.dinners,
//      this.desserts); //  RecipeList(this.recipes);

  @override
  Widget build(BuildContext context) {
    return _buildRecipeList(breakfasts, dinners, desserts, smoothies, owsianki);
  }

  Widget _buildRecipeList(List<Recipe> breakfasts, List<Recipe> dinners, List<Recipe> desserts, List<Recipe> smoothies, List<Recipe> owsianki) {
    List<List> dishes = [breakfasts, dinners, desserts, smoothies, owsianki];
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return _buildRecipeRow(dishes[index]);
        }
    );
  }

  Widget _buildRecipeRow(List<Recipe> list) {
    double height = 150.0;
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index){
          return _buildSingleTile(list[index], height);
          },
      )
    );
  }

  Widget _buildSingleTile(Recipe recipe, double parentSize) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        width: parentSize,
        height: parentSize,
        child: Card(
          child: Column(
            children: <Widget>[
              Image.asset(recipe.imagePath),
              Text(recipe.name),
            ],
          )
        )
      )
    );
  }

}
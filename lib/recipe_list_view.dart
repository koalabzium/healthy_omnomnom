import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './recipe.dart';
import 'recipe_details_view.dart';

class RecipeList extends StatelessWidget {
//  final List<Recipe> recipes;


//  RecipeList(this.Sniadania, this.Obiady,
//      this.Desery); //  RecipeList(this.recipes);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('recipes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildRecipeList(context, snapshot.data.documents);
      },
    );  }

  Widget _buildRecipeList(BuildContext context, List<DocumentSnapshot> snapshot) {

    List<Recipe> Recipes = [];
    Recipes = snapshot.map((data) => getRecipes(context, data)).toList();
    Recipes.forEach((e) => print(e.realization));

    List<Recipe> Lunches = [];
    List<Recipe> Dinners = [];
    List<Recipe> Breakfasts = [];
    List<Recipe> Suppers = [];
    List<Recipe> Snacks = [];

    for(int i=0;i<Recipes.length;i++){
      if(Recipes[i].type == "Obiad"){
        Dinners.add(Recipes[i]);
      } else if (Recipes[i].type == "Sniadanie"){
        Breakfasts.add(Recipes[i]);
      } else if (Recipes[i].type == "Lunch"){
        Lunches.add(Recipes[i]);
      } else if (Recipes[i].type == "Kolacja"){
        Suppers.add(Recipes[i]);
      } else if (Recipes[i].type == "Przekaski"){
        Snacks.add(Recipes[i]);
      }
    }

    Dinners.forEach((e) => print(e.type));

    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildRecipeItem(context, data)).toList(),
    );
  }

  Recipe getRecipes(BuildContext context, DocumentSnapshot data) {
    final recipe = Recipe.fromSnapshot(data);
    return Recipe.fromSnapshot(data);
  }



//  Widget _buildRecipeRow(List<Recipe> list, String listName) {
//    double height = 200.0;
//    double width = 250.0;
//    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//      Padding(
//          padding: EdgeInsets.all(15.0),
//          child: Text(listName,
//              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
//      SizedBox(
//          height: height,
//          child: ListView.builder(
//            scrollDirection: Axis.horizontal,
//            itemCount: list.length,
//            itemBuilder: (BuildContext context, int index) {
//              return _buildSingleTile(context, list[index], height, width);
//            },
//          ))
//    ]);
//  }

  Widget _buildRecipeItem(BuildContext context, DocumentSnapshot data) {
    final recipe = Recipe.fromSnapshot(data);

    return FlatButton(
        child: Container(
            //padding: EdgeInsets.only(left: 2.0),
            child: SizedBox(
                width: 250.0,
                height: 200.0,
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Image.asset(recipe.imagePath),
                    Text(recipe.name),
                  ],
                )))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecipeDetails(recipe)),
          );
        });
  }
}

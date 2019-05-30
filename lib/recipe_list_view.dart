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

    List<Recipe> recipes = [];
    recipes = snapshot.map((data) => getRecipes(context, data)).toList();
    recipes.forEach((e) => print(e.realization));

    List<Recipe> lunches = [];
    List<Recipe> dinners = [];
    List<Recipe> breakfasts = [];
    List<Recipe> suppers = [];
    List<Recipe> snacks = [];

    for(int i=0;i<recipes.length;i++){
      if(recipes[i].type == "Obiad"){
        dinners.add(recipes[i]);
      } else if (recipes[i].type == "Sniadanie"){
        breakfasts.add(recipes[i]);
      } else if (recipes[i].type == "Lunch"){
        lunches.add(recipes[i]);
      } else if (recipes[i].type == "Kolacja"){
        suppers.add(recipes[i]);
      } else if (recipes[i].type == "Przekaski"){
        snacks.add(recipes[i]);
      }
    }

    dinners.forEach((e) => print(e.type));

    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildRecipeItem(context, data)).toList(),
    );
  }

  Recipe getRecipes(BuildContext context, DocumentSnapshot data) {
    final recipe = Recipe.fromSnapshot(data);
    return recipe;
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

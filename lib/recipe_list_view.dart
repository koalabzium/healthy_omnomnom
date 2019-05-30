import 'package:flutter/material.dart';

import './recipe.dart';
import 'recipe_details_view.dart';

class RecipeList extends StatelessWidget {
//  final List<Recipe> recipes;

  final List<Recipe> Sniadania = [
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis2", "type2", ["b", "c", "b", "c"],
        "jak to zrobic2", ["d", "e", "f", "g", "h"], false),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true)
  ];
  final List<Recipe> Obiady = [
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis2", "type2", ["b", "c", "b", "c"],
        "jak to zrobic2", ["d", "e", "f", "g", "h"], false),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true)
  ];
  final List<Recipe> Desery = [
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis2", "type2", ["b", "c", "b", "c"],
        "jak to zrobic2", ["d", "e", "f", "g", "h"], false),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true)
  ];
  final List<Recipe> Koktajle = [
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis2", "type2", ["b", "c", "b", "c"],
        "jak to zrobic2", ["d", "e", "f", "g", "h"], false),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true)
  ];
  final List<Recipe> Owsianki = [
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis2", "type2", ["b", "c", "b", "c"],
        "jak to zrobic2", ["d", "e", "f", "g", "h"], false),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true),
    Recipe("assets/balony.jpg", "Super przepis", "type", ["b", "c", "b", "c"],
        "jak to zrobic", ["d", "e", "f", "g", "h"], true)
  ];

//  RecipeList(this.Sniadania, this.Obiady,
//      this.Desery); //  RecipeList(this.recipes);

  @override
  Widget build(BuildContext context) {
    return _buildRecipeList(Sniadania, Obiady, Desery, Koktajle, Owsianki);
  }

  Widget _buildRecipeList(List<Recipe> Sniadania, List<Recipe> Obiady,
      List<Recipe> Desery, List<Recipe> Koktajle, List<Recipe> Owsianki) {
    List<List> meals = [Sniadania, Obiady, Desery, Koktajle, Owsianki];
    List<String> mealsList = [
      "Sniadania",
      "Obiady",
      "Desery",
      "Koktajle",
      "Owsianki"
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Healthy Omnomnom'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return _buildRecipeRow(meals[index], mealsList[index]);
                })));
  }

  Widget _buildRecipeRow(List<Recipe> list, String listName) {
    double height = 200.0;
    double width = 250.0;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(listName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
      SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildSingleTile(context, list[index], height, width);
            },
          ))
    ]);
  }

  Widget _buildSingleTile(BuildContext context, Recipe recipe,
      double parentHeight, double parentWidth) {
    return FlatButton(
        child: Container(
            //padding: EdgeInsets.only(left: 2.0),
            child: SizedBox(
                width: parentWidth,
                height: parentHeight,
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

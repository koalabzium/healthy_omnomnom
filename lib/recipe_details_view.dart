import 'package:flutter/material.dart';

import './recipe.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  RecipeDetails(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.name),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.favorite_border),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Image.asset(recipe.imagePath),
            ),
//            Container(
//              padding: EdgeInsets.all(10.0),
//              child: Text(recipe.name),
//            ),
            Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Skladniki:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: recipe.ingredients_list
                              .map((ingredient) => Text(ingredient))
                              .toList()),
                    ])),
            Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Przygotowanie:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(recipe.realization),
                    ])),
            Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Wartosci odzywcze:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
//                      Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: recipe.nutritionalFacts
//                              .map((fact) => Text(fact))
//                              .toList()),
                    ]))
          ],
        ))));
  }
}

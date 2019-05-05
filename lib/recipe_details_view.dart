import 'package:flutter/material.dart';
import './recipe.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  RecipeDetails(this.recipe);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Image.asset(recipe.imagePath),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(recipe.name,
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: 2.0)),
        ),
        Container(
            padding: EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Skladniki:',
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.2)),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recipe.ingredients
                      .map((ingredient) => Text(ingredient))
                      .toList()),
            ])),
        Container(
            padding: EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Przygotowanie:',
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.2)),
              Text(recipe.description),
            ])),
        Container(
            padding: EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Wartosci odzywcze:',
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.2)),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recipe.nutritionalFacts
                      .map((fact) => Text(fact))
                      .toList()),
            ]))
      ],
    ));
  }
}

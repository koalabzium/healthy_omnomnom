import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  final String imagePath;
  final dynamic carbonhydrates;
  final dynamic fat;
  final List<dynamic> ingredients_list;
  final dynamic kcal;
  final dynamic protein;
  final String realization;
  final String name;
  final String type;
  final List<dynamic> optional;
  final List<dynamic> required;

  final DocumentReference reference;

//  List<String> ingredients;
//  String description;
//  List<String> nutritionalFacts;
//  bool isFavourite;

  Recipe.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['type'] != null),
        assert(map['carbonhydrates'] != null),
        assert(map['fat'] != null),
        assert(map['ingredients list'] != null),
        assert(map['kcal'] != null),
        assert(map['protein'] != null),
        assert(map['realization'] != null),
        assert(map['optional ingredients'] != null),
        assert(map['required ingredients'] != null),
        name = map['name'],
        type = map['type'],
        carbonhydrates = map['carbonhydrates'],
        fat = map['fat'],
        ingredients_list = map['ingredients list'],
        kcal = map['kcal'],
        protein = map['protein'],
        realization = map['realization'],
        optional = map['optional ingredients'],
        required = map['required ingredients'],
        imagePath = "assets/balony.jpg";

  Recipe.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);


//  Recipe(this.imagePath, this.name, this.type, this.ingredients, this.description,
//      this.nutritionalFacts, this.isFavourite);
}
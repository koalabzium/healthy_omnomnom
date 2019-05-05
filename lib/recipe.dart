class Recipe {
  String imagePath;
  String name;
  String type;
  List<String> ingredients;
  String description;
  List<String> nutritionalFacts;
  bool isFavourite;

  Recipe(this.imagePath, this.name, this.type, this.ingredients, this.description,
      this.nutritionalFacts, this.isFavourite);
}
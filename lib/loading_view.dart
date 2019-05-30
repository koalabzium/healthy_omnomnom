import 'package:flutter/material.dart';
import 'recipe_list_view.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/marble.jpg"),
          fit: BoxFit.cover,
        ),
      ),
//        color: Color.fromRGBO(31, 86, 43, 1),
      child: Center(
        child: FlatButton(
          child: Image.asset("assets/HOlogoWHITE.png"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipeList()),
            );
          },
        ),
      ),
    );
  }
}

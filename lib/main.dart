import 'package:flutter/material.dart';

import './recipe.dart';
import './loading_view.dart';
import './recipe_list_view.dart';
import './recipe_details_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Omnomnom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoadingView(),
    );
  }
}

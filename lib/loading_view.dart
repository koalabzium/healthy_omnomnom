import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(31, 86, 43, 1),
        child: Center(child: Image.asset("assets/HOlogo.png")));
  }
}

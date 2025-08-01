import 'package:flutter/material.dart';




class ArticlesSelection extends StatefulWidget {
  const ArticlesSelection({super.key});

  @override
  State<ArticlesSelection> createState() => _ArticlesSelectionState();
}

class _ArticlesSelectionState extends State<ArticlesSelection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Row( children: [
            Text("Image"),
            Text("Amount")
          ], ),
          Text("Colors"),
          // Grid view
          Row(children: [

          ],)
        ],
      ),
    ));
  }
}

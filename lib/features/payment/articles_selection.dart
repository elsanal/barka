import 'package:flutter/material.dart';

class ArticlesSelection extends StatefulWidget {
  const ArticlesSelection({super.key});

  @override
  State<ArticlesSelection> createState() => _ArticlesSelectionState();
}

class _ArticlesSelectionState extends State<ArticlesSelection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset("assets/images/img10.jpeg"),
                    ),
                  ),
                  Text("Amount"),
                ],
              ),
            ),
            Text("Colors"),
            // Grid view
            Row(children: []),
          ],
        ),
      ),
    );
  }
}

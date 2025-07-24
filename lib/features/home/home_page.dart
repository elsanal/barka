import 'package:barka/features/home/custom_app_bar.dart';
import 'package:barka/features/home/home_body.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/product_card.dart';
import '../product/product_detail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(children: [
        TopAppBarWithCategories(
            categories: ['Sacs à main', 'Chaussures', 'Robes', 'Électroniques',
              'Enfants', 'Bébés', 'Agriculture', 'Motos', 'Véhicules', 'Pièces détachées',
            ]
        ),
        // HomeBody()
      ],)
    );
  }
}

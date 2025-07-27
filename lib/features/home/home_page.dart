import 'package:barka/features/home/custom_app_bar.dart';
import 'package:barka/features/home/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopAppBarWithCategories(
              categories: [
                'Tout',
                'Sacs à main',
                'Chaussures',
                'Robes',
                'Électroniques',
                'Enfants',
                'Bébés',
                'Agriculture',
                'Motos',
                'Véhicules',
                'Pièces détachées',
              ],
            ),
            SizedBox(height: 5),
            Expanded(
              child: HomeBody(),
            ), // 👈 prevents overflow & fills the rest of screen
          ],
        ),
      ),
    );
  }
}

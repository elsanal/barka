import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget logisticRefundPolicy(BuildContext context) {
  return SliverToBoxAdapter(
    child: Column(
      children: [
        GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Délai de livraison"),
                content: SingleChildScrollView(
                  child: Text(
                    "Voici les détails concernant le délai de livraison. Veuillez lire attentivement toutes les informations.",
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text("Fermer"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            },
          ),
          child: ListTile(
            title: Text("Délai de livraison"),
            tileColor: Colors.white,
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 40.w),
          ),
        ),
        GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Tarif de livraison"),
                content: SingleChildScrollView(
                  child: Text(
                    "Voici les détails concernant le délai de livraison. Veuillez lire attentivement toutes les informations.",
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text("Fermer"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            },
          ),
          child: ListTile(
            title: Text("Tarif de livraison"),
            tileColor: Colors.white,
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 40.w),
          ),
        ),
        GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Lieu de reception"),
                content: SingleChildScrollView(
                  child: Text(
                    "Voici les détails concernant le délai de livraison. Veuillez lire attentivement toutes les informations.",
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text("Fermer"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            },
          ),
          child: ListTile(
            title: Text("Lieu de reception"),
            tileColor: Colors.white,
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 40.w),
          ),
        ),
      ],
    ),
  );
}

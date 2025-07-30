import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget logisticRefundPolicy() {
  return SliverToBoxAdapter(
    child: Column(
      children: [
        ListTile(
          title: Text("Combien de temps pour etre livre?"),
          tileColor: Colors.white,
          trailing: Icon(Icons.arrow_forward_ios_sharp, size: 40.w),
        ),
        ListTile(
          title: Text("Comment annuler une commande?"),
          tileColor: Colors.white,
          trailing: Icon(Icons.arrow_forward_ios_sharp, size: 40.w),
        ),
        ListTile(
          title: Text("Lieu de chargement et dechargement"),
          tileColor: Colors.white,
          trailing: Icon(Icons.arrow_forward_ios_sharp, size: 40.w),
        ),
      ],
    ),
  );
}

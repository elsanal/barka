import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget productCharacteristicsPopUp(BuildContext context) {
  final List<Map<String, String>> productCharacteristics = [
    {'label': 'Modèle', 'value': 'iPhone 16 Pro Max'},
    {'label': 'Marque', 'value': 'Apple'},
    {'label': 'Processeur', 'value': 'Apple A18 Bionic'},
    {'label': 'Mémoire RAM', 'value': '12 Go'},
    {'label': 'Stockage', 'value': '256 Go'},
    {'label': 'Système d’exploitation', 'value': 'iOS 18'},
    {'label': 'Capacité de batterie', 'value': '4500 mAh'},
    {'label': 'Puissance de charge', 'value': '30W'},
    {'label': 'Tension', 'value': '5V / 3A'},
    {'label': 'Connectivité', 'value': '5G, Wi-Fi 6E, Bluetooth 5.3'},
    {'label': 'Normes', 'value': 'CE, RoHS, FCC'},
    {'label': 'Dimensions', 'value': '160.8 x 78.1 x 7.4 mm'},
    {'label': 'Poids', 'value': '228 g'},
    {'label': 'Indice de protection', 'value': 'IP68'},
  ];

  return SliverToBoxAdapter(
    child: GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(23)),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16.0),
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12, // horizontal space between items
                  runSpacing: 8, // vertical space between lines
                  children: productCharacteristics.map((item) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${item['label']}: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: item['value'],
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close"),
                ),
              ],
            ),
          );
        },
      ),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 10.h, left: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Plus de details du produit"),
              trailing: Icon(Icons.arrow_forward_ios_sharp, size: 40.w),
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 12, // horizontal space between items
              runSpacing: 8, // vertical space between lines
              children: productCharacteristics.take(6).map((item) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${item['label']}: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: item['value'],
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    ),
  );
}

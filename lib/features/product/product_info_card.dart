import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoCard extends StatelessWidget {
  final String description;
  final String price1;
  final String price2;
  final String price3;

  const ProductInfoCard({
    super.key,
    required this.description,
    required this.price1,
    required this.price2,
    required this.price3,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                description,
                softWrap: true,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Chip(
                    backgroundColor: Colors.black12,
                    label: Column(
                      children: [
                        Text.rich(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                            color: Colors.deepOrange,
                          ),
                          textAlign: TextAlign.start,
                          TextSpan(text: "$price1 CFA"),
                        ),
                        Text.rich(
                          textAlign: TextAlign.start,
                          TextSpan(text: "1ere fois"),
                        ),
                      ],
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.black12,
                    label: Column(
                      children: [
                        Text.rich(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                            color: Colors.deepOrange,
                          ),
                          textAlign: TextAlign.start,
                          TextSpan(text: "$price2 CFA"),
                        ),
                        Text.rich(
                          textAlign: TextAlign.start,
                          TextSpan(text: "Prix a partir de 1"),
                        ),
                      ],
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.black12,
                    label: Column(
                      children: [
                        Text.rich(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                            color: Colors.deepOrange,
                          ),
                          textAlign: TextAlign.start,
                          TextSpan(text: "$price3 CFA"),
                        ),
                        Text.rich(
                          textAlign: TextAlign.start,
                          TextSpan(text: "Prix a partir de 100"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

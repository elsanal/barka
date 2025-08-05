import 'dart:math';

import 'package:barka/features/payment/payment_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future showItemSelection(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: min(screenHeight * 0.9, 1620.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _TopInfoBar(),
            Divider(height: 5, color: Colors.grey[400], thickness: 1.5),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _ColorSelectionGrid(),
                    // const SizedBox(height: 8),
                    const _QuantityRow(),
                    Divider(height: 8, color: Colors.grey[300], thickness: 5),
                    const _PaymentMethodSection(),
                    Divider(height: 8, color: Colors.grey[300], thickness: 5),
                    const _LogisticsSection(),
                  ],
                ),
              ),
            ),
            Divider(height: 8, color: Colors.grey[400], thickness: 1.5),
            const _PaymentSummaryBar(),
          ],
        ),
      );
    },
  );
}

class _TopInfoBar extends StatelessWidget {
  const _TopInfoBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            "assets/images/img10.jpeg",
            height: 200.h,
            width: 200.h,
            fit: BoxFit.cover,
            cacheWidth: 300,
            cacheHeight: 300,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sélection actuelle",
                style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Text(
                "253 articles sélectionnés",
                style: TextStyle(fontSize: 45.sp, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

class _ColorSelectionGrid extends StatelessWidget {
  const _ColorSelectionGrid();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choix de couleur",
            style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          GridView.builder(
            itemCount: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.grey[300]!),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    "assets/images/img${index + 3}.jpeg",
                    fit: BoxFit.cover,
                    cacheWidth: 200,
                    cacheHeight: 200,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityRow extends StatelessWidget {
  const _QuantityRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quantite",
          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
          padding: EdgeInsets.only(top: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey[300]!),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Produit élégant",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Prix unitaire: 2 000 FCFA",
                    style: TextStyle(fontSize: 40.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_circle_outline),
                    iconSize: 60.sp,
                  ),
                  Text(
                    "30",
                    style: TextStyle(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline),
                    iconSize: 60.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PaymentMethodSection extends StatelessWidget {
  const _PaymentMethodSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 12.w, right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Méthode de paiement",
            style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 8.h,
            children: [
              buildPaymentOption("Orange Money", "orange"),
              buildPaymentOption("Moov Money", "moov"),
              buildPaymentOption("Telecel Money", "telecel"),
              buildPaymentOption("SankMoney", "sank"),
              buildPaymentOption("Wave", "wave"),
              buildPaymentOption("Bank Card", "card"),
            ],
          ),
        ],
      ),
    );
  }
}

class _LogisticsSection extends StatelessWidget {
  const _LogisticsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choix logistique",
            style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),
          buildLogisticOption("Par mer", "9 000 FCFA / m³", "sea"),
          SizedBox(height: 10.h),
          buildLogisticOption("Par cargo", "12 000 FCFA / kg", "cargo"),
        ],
      ),
    );
  }
}

class _PaymentSummaryBar extends StatelessWidget {
  const _PaymentSummaryBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _buildSummaryRow("Nombre total", "1000"),
          _buildSummaryRow("Montant total:", "2 593 058 FCFA"),
          _buildSummaryRow("Mode de Livraison:", "Bateau"),
          SizedBox(height: 6.h),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 80.h,
            child: ElevatedButton.icon(
              onPressed: () => print("Arrived payed"),
              icon: const Icon(Icons.payment),
              label: Text(
                "Confirmer et Payer",
                style: TextStyle(fontSize: 50.sp),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 40.sp, color: Colors.black54),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String selectedPayment = "orange"; // Set default selected
String selectedLogistic = "sea"; // Set default selected

Widget buildPaymentOption(String label, String value) {
  return ChoiceChip(
    label: Text(label),
    selected: selectedPayment == value,
    onSelected: (_) {
      selectedPayment = value;
      // You may want to call setState if this is inside a stateful widget
    },
    selectedColor: Colors.deepOrange,
    backgroundColor: Colors.grey[200],
    labelStyle: TextStyle(
      color: selectedPayment == value ? Colors.white : Colors.black,
    ),
  );
}

Widget buildLogisticOption(String title, String subtitle, String value) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: selectedLogistic == value
            ? Colors.deepOrange
            : Colors.grey[300]!,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(10.r),
      color: selectedLogistic == value
          ? Colors.deepOrange.withOpacity(0.1)
          : Colors.white,
    ),
    child: RadioListTile<String>(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      value: value,
      groupValue: selectedLogistic,
      onChanged: (newValue) {
        selectedLogistic = newValue!;
        // You may want to call setState if this is inside a stateful widget
      },
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40.sp),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 35.sp, color: Colors.grey[600]),
      ),
      activeColor: Colors.deepOrange,
    ),
  );
}

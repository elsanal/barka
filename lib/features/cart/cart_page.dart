import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  var categories = [
    'Tout',
    'Électroniques',
    'Alimentaire',
    'Motorise',
    'Habillement',
  ];

  int selectedIndex = -1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                return ChoiceChip(
                  label: Text(
                    categories[index],
                    style: TextStyle(
                      color: selectedIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  selected: selectedIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedIndex = selected ? index : selectedIndex;
                    });
                    print(categories[index]);
                  },
                  selectedColor: Colors.deepOrange,
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: selectedIndex == index
                          ? Colors.deepOrange
                          : Colors.grey.shade400,
                    ),
                  ),
                  // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  padding: EdgeInsets.only(bottom: 20.h),
                );
              },
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: true, onChanged: (bool? newValue) {}),
                  SizedBox(width: 4),
                  Text("Shop name"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CupertinoCheckbox(
                    value: true,
                    onChanged: (bool? newValue) {},
                  ),
                  SizedBox(width: 4),
                  SizedBox(
                    width: 150.w,
                    child: ClipRRect(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset("assets/images/img10.jpeg"),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Sac de meilleure qualite")],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

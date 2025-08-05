import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget productPhotosShow(BuildContext context) {
  return SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Plus de details",
          style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true, // important when used inside another scrollable
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: AspectRatio(
                  aspectRatio: 1, // square
                  child: Image.asset(
                    'assets/images/img${3 + index}.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}

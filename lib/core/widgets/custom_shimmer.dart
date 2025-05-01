import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/theming/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'card_shimmer.dart';

class CustomShimmerProductsEffect extends StatelessWidget {
  const CustomShimmerProductsEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:  ColorsManager.colorSecondry, // Your specified color
      highlightColor:  ColorsManager.colorSecondry.withOpacity(0.3), // Lier version for shimmer
      period: const Duration(milliseconds: 1500), // Animation duration
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCardShimmer(
                    onTap: () {

                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
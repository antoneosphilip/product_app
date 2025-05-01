import 'package:flutter/material.dart';
import 'package:products_app/core/theming/colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerProductDetailsEffect extends StatelessWidget {
  const CustomShimmerProductDetailsEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.colorPrimary,
      highlightColor: ColorsManager.colorPrimary.withOpacity(0.3),
      period: const Duration(milliseconds: 1500), // Animation duration
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer effect for a header
            Container(
              width: double.infinity,
              height: 24.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 16.0),

            // Shimmer effect for content
            Row(
              children: [
                // Circle for avatar
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Lines for text
                      Container(
                        width: double.infinity,
                        height: 16.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: 200.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
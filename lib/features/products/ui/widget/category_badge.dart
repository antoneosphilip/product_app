import 'package:flutter/cupertino.dart';

import '../../../../core/theming/colors.dart';
import '../../data/models/product_details_model.dart';

class CategoryBadge extends StatelessWidget {
  final ProductDetailsModel product;

  const CategoryBadge({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.colorSecondry2.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          product.category.toUpperCase(),
          style: const TextStyle(
            color: ColorsManager.colorSecondry2,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

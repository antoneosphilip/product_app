import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../data/models/product_details_model.dart';

class Description extends StatelessWidget {
  final ProductDetailsModel product;

  const Description ({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'Description',
            style: TextStyles.font20ExtraBold
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),
          child: Text(
              product.description,
              style: TextStyles.font16Regular
          ),
        ),
      ],
    );
  }
}

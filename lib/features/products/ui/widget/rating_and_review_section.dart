import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_details_model.dart';

class RatingAndReviewSection extends StatelessWidget {
  final ProductDetailsModel product;

  const RatingAndReviewSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8
          ),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                '4.${product.id % 10}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Text(
          '${120 + (product.id * 3)} Reviews',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

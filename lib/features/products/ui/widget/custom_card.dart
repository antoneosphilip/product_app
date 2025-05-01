import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_chached_network_image.dart';
import '../../data/models/get_products_model.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: CustomCachedNetworkImage(
                  imageUrl: product!.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        product!.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font14BlackBold
                    ),
                    const SizedBox(height: 4),
                    Text(
                        '\$${product!.price.toStringAsFixed(2)}',
                        style:TextStyles.font14BurbleBold
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

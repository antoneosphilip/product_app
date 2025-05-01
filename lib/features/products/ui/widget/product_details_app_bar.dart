import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/features/products/data/models/product_details_model.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_chached_network_image.dart';

class ProductDetailsAppBar extends StatelessWidget {
  final ProductDetailsModel product;
  const ProductDetailsAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const SizedBox(),
      expandedHeight: 350,
      floating: false,
      pinned: true,
      backgroundColor: ColorsManager.colorSecondry,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: CustomCachedNetworkImage(
            imageUrl: product.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

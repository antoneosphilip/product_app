import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_chached_network_image.dart';

class ProductCardShimmer extends StatelessWidget {
  final VoidCallback onTap;

  const ProductCardShimmer({
    super.key,
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
                child: const CustomCachedNetworkImage(
                  imageUrl: '',
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
                       '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font14BlackBold
                    ),
                    const SizedBox(height: 4),
                    Text(
                        '2',
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

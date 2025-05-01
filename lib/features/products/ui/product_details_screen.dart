import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/theming/colors.dart';
import 'package:products_app/features/products/logic/cubit/profile_cubit.dart';
import 'package:products_app/features/products/logic/cubit/profile_states.dart';
import 'package:products_app/features/products/ui/widget/add_to_cart_butoon.dart';
import 'package:products_app/features/products/ui/widget/category_badge.dart';
import 'package:products_app/features/products/ui/widget/description.dart';
import 'package:products_app/features/products/ui/widget/product_details_app_bar.dart';
import 'package:products_app/features/products/ui/widget/rating_and_review_section.dart';
import 'package:products_app/features/products/ui/widget/title_and_price_row.dart';

import '../../../core/theming/styles.dart';
import '../../../core/widgets/custom_error.dart';
import '../../../core/widgets/custom_shimmer_product_details.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  final ProductCubit productCubit;

  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.productCubit,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    widget.productCubit.getProductDetails(id: widget.productId);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.productCubit,
      child:
          BlocBuilder<ProductCubit, ProductStates>(builder: (context, state) {
        final productDetailsCubit = ProductCubit.get(context);
        if (state is GetProductDetailsLoadingState) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: const CustomShimmerProductDetailsEffect(),
            ),
          );
        }
        if (state is GetProductDetailsErrorState) {
          return Center(
            child: AnimatedErrorWidget(
              title: "Loading Error",
              message: state.message,
              lottieAnimationPath: 'assets/animation/error.json',
              onRetry: () =>
                  productDetailsCubit.getProductDetails(id: widget.productId),
            ),
          );
        }
        final product = productDetailsCubit.getProductDetailsModel;

        return Scaffold(
            appBar: AppBar(
              titleTextStyle: TextStyles.font18WhiteBold
                  .copyWith(color: ColorsManager.colorPrimary),
              leading: const Icon(Icons.arrow_back_ios_outlined,
                  color: ColorsManager.colorPrimary),
              backgroundColor: Colors.white,
              title: const Text('Product Details'),
            ),
            body: FadeTransition(
              opacity: _fadeAnimation,
              child: CustomScrollView(
                slivers: [
                  ProductDetailsAppBar(
                    product: product!,
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category badge
                            CategoryBadge(
                              product: product,
                            ),
                            SizedBox(height: 16.h),
                            // Title and price row
                            TitleAndPriceRow(
                              product: product,
                            ),
                            SizedBox(height: 32.h),
                            // Rating and reviews section
                            RatingAndReviewSection(product: product),
                            SizedBox(height: 32.h),

                            // Description section
                            Description(
                              product: product,
                            ),
                            SizedBox(height: 36.h),
                            // Add to cart button
                            const AddToCartButton(),
                            SizedBox(height: 24.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}

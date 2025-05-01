import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/helpers/extensions.dart';
import 'package:products_app/features/products/data/repos/products_repo.dart';
import 'package:products_app/features/products/logic/cubit/profile_cubit.dart';
import 'package:products_app/features/products/logic/cubit/profile_states.dart';
import 'package:products_app/features/products/ui/widget/custom_card.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/custom_empity_list.dart';
import '../../../core/widgets/custom_error.dart';
import '../../../core/widgets/custom_shimmer.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Products',style: TextStyles.font21BlackSemiBold.copyWith(color: Colors.white),),
        leading: const SizedBox(),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductCubit(getIt.get<ProductRepo>())..getProducts(),
        child: BlocBuilder<ProductCubit, ProductStates>(
          builder: (context, state) {
            final productCubit = ProductCubit.get(context);
            if (state is GetProductLoadingState) {
              return Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: const CustomShimmerProductsEffect(),
              );
            }
            if (state is GetProductErrorState) {
              return Center(
                child: AnimatedErrorWidget(
                  title: "Loading Error",
                  message: state.message,
                  lottieAnimationPath: 'assets/animation/error.json',
                  onRetry: () => productCubit.getProducts(),
                ),
              );
            }
            final products = productCubit.getProductsModel;
            if (products == null || products.isEmpty) {
              return const Center(
                child: AnimatedEmptyList(
                  title: "No Products Found",
                  subtitle: "",
                  lottieAnimationPath: 'assets/animation/empity_list.json',
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: ()async {
                productCubit.getProducts();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(
                            product: product,
                            onTap: () {
                              context.pushNamed(
                                Routes.productDetailsScreen,
                                arguments: {
                                  'productId': product.id,
                                  'cubit': productCubit,
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

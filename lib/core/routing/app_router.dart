import 'package:flutter/material.dart';
import 'package:products_app/core/routing/routes.dart';
import 'package:products_app/features/products/ui/product_details_screen.dart';
import 'package:products_app/features/products/ui/products_screen.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {

      case Routes.productsScreen:
        return MaterialPageRoute(
          builder: (_) => const ProductsScreen(),
        );
      case Routes.productDetailsScreen:
        final arguments = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) =>  ProductDetailScreen(productId:arguments?['productId'], productCubit:  arguments?['cubit'],),
        );
      default:
        return null;
    }
  }
}

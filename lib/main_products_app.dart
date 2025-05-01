import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/routing/routes.dart';
import '../core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

class ProductsApp extends StatelessWidget {
  final AppRouter appRouter;

  const ProductsApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'ProductsApp',
        // builder:EasyLoading.init(),
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute:Routes.productsScreen,
      ),
    );
  }
}

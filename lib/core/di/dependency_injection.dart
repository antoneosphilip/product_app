
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:products_app/features/products/data/apis/products_api_server.dart';
import 'package:products_app/features/products/data/repos/products_repo.dart';
import 'package:products_app/features/products/logic/cubit/profile_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  //// products/////
  getIt.registerLazySingleton<ProductApiService>(() => ProductApiService(dio: dio));
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));

}

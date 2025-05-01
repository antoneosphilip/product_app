import 'package:either_dart/either.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../apis/products_api_server.dart';
import '../models/get_products_model.dart';
import '../models/product_details_model.dart';

class ProductRepo {
  final ProductApiService _apiService;

  ProductRepo(this._apiService);

  Future<Either<ErrorHandler, GetProductsModel>> getProducts() async {
    try {
      final response = await _apiService.getProducts();
      return Right(GetProductsModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
  Future<Either<ErrorHandler, ProductDetailsModel>> getProductDetails({required int id}) async {
    try {
      final response = await _apiService.getProductDetails(id: id);
      return Right(ProductDetailsModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}

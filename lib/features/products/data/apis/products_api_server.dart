
import 'package:dio/dio.dart';

import '../../../../core/networking/api_networking.dart';


class ProductApiService {
  final Dio dio;

  ProductApiService({required this.dio});

  Future<Response> getProducts() async {
    try {
      final response = await dio.get(
        ApiConstants.getProductsUrl,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<Response> getProductDetails({required int id}) async {
    try {
      final response = await dio.get(
        ApiConstants.getProductDetailsUrl(id: id),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}

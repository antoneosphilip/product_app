import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/core/widgets/flutter_show_toast.dart';
import 'package:products_app/features/products/data/models/get_products_model.dart';

import '../../../../core/widgets/database_sevice.dart';
import '../../data/models/product_details_model.dart';
import '../../data/repos/products_repo.dart';
import 'profile_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  final ProductRepo _profileRepo;

  ProductCubit(this._profileRepo) : super(ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of<ProductCubit>(context);
  final DatabaseService _dbService = DatabaseService();
  StreamSubscription? subscription;

  List<Product>? getProductsModel;
  ProductDetailsModel? getProductDetailsModel;

  void getProducts() async {
    emit(GetProductLoadingState());
    try {
      if (await checkInternet()) {
        final response = await _profileRepo.getProducts();
        response.fold(
              (left) async {
            print("Error fetching products: $left");
            final localProducts = await _dbService.getProducts();
            if (localProducts.isNotEmpty) {
              getProductsModel = localProducts;
              emit(GetProductSuccessState());
            } else {
              emit(GetProductErrorState(message: left.toString()));
            }
          },
              (right) async {
            if (right.products != null) {
              getProductsModel = right.products;
              await _dbService.saveProducts(right.products!);
              emit(GetProductSuccessState());
            } else {
              emit(GetProductErrorState(message: "No products received from server"));
            }
          },
        );
      } else {
        final localProducts = await _dbService.getProducts();
        if ( localProducts.isNotEmpty) {
          getProductsModel = localProducts;
          emit(GetProductSuccessState());
        } else {
          emit(GetProductErrorState(message: "No internet connection and no cached products"));
        }
      }
    } catch (dbError) {
      emit(GetProductErrorState(message: dbError.toString()));
    }
  }

  void getProductDetails({required int id}) async {
    emit(GetProductDetailsLoadingState());
    try {
      if (await checkInternet()) {
        final response = await _profileRepo.getProductDetails(id: id);

        response.fold(
              (left) async {
            print("Error fetching product details: $left");
            final localProduct = await _dbService.getProduct(id);
            if (localProduct != null) {
              getProductDetailsModel = localProduct;
              emit(GetProductDetailsSuccessState());
            } else {
              emit(GetProductDetailsErrorState(message: left.apiErrorModel.title));
            }
          },
              (right) async {
            getProductDetailsModel = right;
            emit(GetProductDetailsSuccessState());
          },
        );
      } else {
        print("elseeee");
        final localProduct = await _dbService.getProduct(id);
        print("localllll ${localProduct?.title}");
        if (localProduct != null) {
          getProductDetailsModel = localProduct;
          emit(GetProductDetailsSuccessState());
        } else {
          print("nulll");
          emit(GetProductDetailsErrorState(message: "No internet connection and no cached product"));
        }
      }
    } catch (dbError) {
      print("errrrorr ${dbError}");
      emit(GetProductDetailsErrorState(message: dbError.toString()));
    }
  }
  Future<bool> checkInternet() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }
}

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

////// Get Products//////
class GetProductLoadingState extends ProductStates {}
class  GetProductSuccessState extends ProductStates {
}
class GetProductErrorState extends ProductStates {
  final String message;
  GetProductErrorState({required this.message});
}

//// Get Product Deatils/////

class GetProductDetailsLoadingState extends ProductStates {}
class  GetProductDetailsSuccessState extends ProductStates {
}
class GetProductDetailsErrorState extends ProductStates {
  final String message;
  GetProductDetailsErrorState({required this.message});
}




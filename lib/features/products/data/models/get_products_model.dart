class GetProductsModel {
  final List<Product>? products;

  GetProductsModel({required this.products});

  factory GetProductsModel.fromJson(List<dynamic> jsonList) {
    return GetProductsModel(
      products: jsonList.map((item) => Product.fromJson(item)).toList(),
    );
  }

  List<Map<String, dynamic>> toMapList() {
    return products!.map((product) => product.toMap()).toList();
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final String category;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.category});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        price: (json['price'] as num).toDouble(),
        category: json['category'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'price': price,
        'category': category
      };
}

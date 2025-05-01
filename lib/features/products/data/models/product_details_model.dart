class ProductDetailsModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final String category;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    image: json['image'],
    price: (json['price'] as num).toDouble(),
    category: json['category']
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'image': image,
    'price': price,
    'category':category
  };
}

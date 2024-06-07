class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.image,
    this.title = '',
    this.price = 0.0,
  });

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price']?.toDouble(),
      image: json['image'],
      quantity: json['quantity'],
    );
  }
}
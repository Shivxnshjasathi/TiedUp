import 'package:get/state_manager.dart';

class Product {
  final String sellerno;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  final String tag;


  Product({
    required this.sellerno,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.price,
    required this.tag,
  });

  Map<String,dynamic> toJson()=>
      {
        'price': price,
        'productDescription': productDescription,
        'productImage': productImage,
        'productName': productName,
        'sellerno': sellerno,
        'tag': tag,
      };

  static Product fromJson(Map<String,dynamic> json)=>
      Product(
        price: double.parse(json['price'].toString()),
        productDescription: json['productDescription'].toString(),
        productImage: json['productImage'].toString(),
        productName: json['productName'].toString(),
        sellerno: json['sellerno'].toString(),
        tag: json['tag'].toString(),
      );

  final isFavorite = false.obs;
}

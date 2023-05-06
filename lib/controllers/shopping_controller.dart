import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:tiedup/models/products.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getitem();
    //getitem();
  }

  Future getitem() async {
    List<Product> prducts = [];

    final collectionRef = FirebaseFirestore.instance.collection("Items");

    final docsRef = await collectionRef.get();

    docsRef.docs.forEach((element) {
      prducts.add(Product.fromJson(element.data()));
    });

    products.value = prducts;
  }

  Future<bool> setItem(Product product) async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection("Items");
      await collectionRef.doc().set(product.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}

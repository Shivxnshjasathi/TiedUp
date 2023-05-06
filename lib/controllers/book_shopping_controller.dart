import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:tiedup/models/bookproduct.dart';
import 'package:tiedup/models/products.dart';

class bookShoppingController extends GetxController {
  var bookproducts = <bookProduct>[].obs;

  @override
  void onInit() {
    super.onInit();
    getbookitem();
    //getitem();
  }

  Future getbookitem() async {
    List <bookProduct> bookprducts = [];

    final collectionRef = FirebaseFirestore.instance
        .collection("Items");

    final docsRef = await collectionRef.where('tag', isEqualTo: 'book').get();

    docsRef.docs.forEach((element) {
      bookprducts.add(bookProduct.fromJson(element.data()));
    });

    bookproducts.value = bookprducts;
  }

}
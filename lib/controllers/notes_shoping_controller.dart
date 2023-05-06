import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:tiedup/models/bookproduct.dart';
import 'package:tiedup/models/products.dart';

class notesShoppingController extends GetxController {
  var notesproducts = <bookProduct>[].obs;

  @override
  void onInit() {
    super.onInit();
    getnotesitem();
    //getitem();
  }

  Future getnotesitem() async {
    List <bookProduct> bookprducts = [];

    final collectionRef = FirebaseFirestore.instance
        .collection("Items");

    final docsRef = await collectionRef.where('tag', isEqualTo: 'notes').get();

    docsRef.docs.forEach((element) {
      bookprducts.add(bookProduct.fromJson(element.data()));
    });

    notesproducts.value = bookprducts;
  }

}
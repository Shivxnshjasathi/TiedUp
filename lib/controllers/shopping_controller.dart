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
    List <Product> prducts = [];

    final collectionRef = FirebaseFirestore.instance
        .collection("Items");

    final docsRef = await  collectionRef.get();

    docsRef.docs.forEach((element) {
      prducts.add(Product.fromJson(element.data()));
    });

    products.value = prducts;
    //setItem(products.value[0]);
  }


  Future setItem(Product product) async {
    final collectionRef = FirebaseFirestore.instance
        .collection("Items");
    await collectionRef.doc().set(product.toJson());
  }

}
//
//   void fetchProducts() async {
//     await Future.delayed(Duration(seconds: 1));
//     var productResult = [
//       Product(
//           sellerno: 1,
//           price: 300,
//           productDescription: 'English Shivani 3sem'
//               '(test product)',
//           productImage: 'https://apollo-singapore.akamaized.net/v1/files/x4bghs83j8rb2-IN/image;s=272x0',
//           productName: 'English Book'),
//       Product(
//           sellerno: 2,
//           price: 400,
//           productDescription: 'scientific calculator'
//               '(test product)',
//           productImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsYVCGTEbxJ3hsW-0woukZ1oHdUcuPwsWSkw',
//           productName: 'Calculator'),
//       Product(
//           sellerno: 3,
//           price: 490.5,
//           productDescription: 'ED drafter'
//               '(test product)',
//           productImage: 'https://apollo-singapore.akamaized.net/v1/files/2b7hwvoijujt2-IN/image;s=850x0',
//           productName: 'Drafter'),
//       Product(
//           sellerno: 3,
//           price: 490.5,
//           productDescription: 'Dsa all notes'
//               '(test product)',
//           productImage: 'https://topperworld.in/media/2022/11/DSA-1.png',
//           productName: 'DSA Notes'),
//     ];
//
//     products.value = productResult;
//   }
// }

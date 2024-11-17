import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> get getProducts {
    return products;
  }

  ProductModel? findByProdId(String productId) {
    if (products.where((element) => element.productId == productId).isEmpty) {
      return null;
    }
    return products.firstWhere((element) => element.productId == productId);
  }

  List<ProductModel> findByCategory({required String categoryName}) {
    List<ProductModel> categoryList = products
        .where(
          (element) => element.productCategory.toLowerCase().contains(
                categoryName.toLowerCase(),
              ),
        )
        .toList();
    return categoryList;
  }

  List<ProductModel> searchQuery(
      {required String searchText, required List<ProductModel> passedList}) {
    List<ProductModel> searchList = passedList
        .where(
          (element) => element.productTitle.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    return searchList;
  }

  final productDb = FirebaseFirestore.instance.collection("products");
  Future<List<ProductModel>> fetchProducts() async {
    try {
      await productDb
          .orderBy('createdAt', descending: false)
          .get()
          .then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, ProductModel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<ProductModel>> fetchProductsStream() {
    try {
      return productDb.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, ProductModel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }
  // List<ProductModel> products = [
  //   // Phones
  //   ProductModel(
  //     //1
  //     productId: 'iphone14-128gb-black',
  //     productTitle: "Apple iPhone 14 Pro (128GB) - Black",
  //     productPrice: "1399.99",
  //     productCategory: "Phones",
  //     productDescription:
  //         "6.1-inch Super Retina XDR display with ProMotion and always-on display. Dynamic Island, a new and magical way to interact with your iPhone. 48MP main camera for up to 4x higher resolution. Cinematic mode, now in 4K Dolby Vision up to 30 fps. Action mode, for stable and smooth videos when you're on the move. Accident detection, vital safety technology that calls for help for you. All-day battery life and up to 23 hours of video playback.",
  //     productImage: "https://i.ibb.co/BtMBSgK/1-iphone14-128gb-black.webp",
  //     productQuantity: "10",
  //   ),
  //   ProductModel(
  //     //2
  //     productId: 'iphone13-mini-256gb-midnight',
  //     productTitle:
  //         "iPhone 13 Mini, 256GB, Midnight - Unlocked (Renewed Premium)",
  //     productPrice: "659.99",
  //     productCategory: "Phones",
  //     productDescription:
  //         "5.4 Super Retina XDR display. 5G Superfast downloads, high quality streaming. Cinematic mode in 1080p at 30 fps. Dolby Vision HDR video recording up to 4K at 60 fps. 2X Optical zoom range. A15 Bionic chip. New 6-core CPU with 2 performance and 4 efficiency cores. New 4-core GPU. New 16-core Neural Engine. Up to 17 hours video playback. Face ID. Ceramic Shield front. Aerospace-grade aluminum. Water resistant to a depth of 6 meters for up to 30 minutes. Compatible with MagSafe accessories and wireless chargers.",
  //     productImage:
  //         "https://i.ibb.co/nbwTvXQ/2-iphone13-mini-256gb-midnight.webp",
  //     productQuantity: "15",
  //
  // ];
}

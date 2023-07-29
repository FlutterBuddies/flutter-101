import 'package:cloud_firestore/cloud_firestore.dart';

import 'product.dart';

class ProductsRepository {
  static Future<List<Product>> loadProducts(Category category) async {
    final db = FirebaseFirestore.instance;

    final querySnapshot = await switch (category) {
      Category.all => db.collection("products").get(),
      Category.accessories => db
          .collection("products")
          .where("category", isEqualTo: "accessories")
          .get(),
      Category.clothing => db
          .collection("products")
          .where("category", isEqualTo: "clothing")
          .get(),
      Category.home =>
        db.collection("products").where("category", isEqualTo: "home").get(),
    };

    final products = querySnapshot.docs
        .map((e) => Product(
              category: Category.values.byName(e['category']),
              id: e['id'],
              isFeatured: e['isFeatured'],
              name: e['name'],
              price: e['price'],
            ))
        .toList();

    return products;
  }
}

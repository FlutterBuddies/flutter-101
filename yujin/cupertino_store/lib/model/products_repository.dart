import 'package:cloud_firestore/cloud_firestore.dart';

import 'product.dart';

class ProductsRepository {
  static Future<List<Product>> loadProducts(Category category) async {
    final fireStore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await fireStore.collection('/products').get();
    final allProducts = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Product(
        category: Category.values.byName(data['category']),
        id: data['id'],
        isFeatured: data['isFeatured'],
        name: data['name'],
        price: data['price'],
      );
    }).toList();

    switch (category) {
      case Category.all:
        return allProducts;
      default:
        return allProducts.where((p) => p.category == category).toList();
    }
  }
}

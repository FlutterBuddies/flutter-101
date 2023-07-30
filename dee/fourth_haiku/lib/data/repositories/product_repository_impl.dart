import '../../domain/models/product.dart';
import '../../domain/repositories/abstract/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl();

  @override
  Future<List<Product>> getAllProducts() async {
    var productData = [
    {'productName': 'Google Search'},
    {'productName': 'YouTube'},
    {'productName': 'Android'},
    {'productName': 'Google Maps'},
    {'productName': 'Gmail'}
    ];
    return productData.map((item) => Product.fromMap(item)).toList();
  }
}

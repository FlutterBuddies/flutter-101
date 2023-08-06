import 'package:haiku/data/repositories/product_repository_impl.dart';
import 'package:haiku/domain/models/product.dart';
import 'package:haiku/domain/repositories/abstract/product_repository.dart';

class ProductController {
  final ProductRepository productRepository = ProductRepositoryImpl();

  Future<List<Product>> getProducts() {
    return productRepository.getAllProducts();
  }
}

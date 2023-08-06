import 'package:haiku/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}

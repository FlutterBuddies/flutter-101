enum Category {
  all,
  accessories,
  clothing,
  home,
}

class Product {
  const Product({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.price,
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final int price;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => '$name (id=$id)';

  static fromDocs(Map<String, dynamic> docs) {
    print("asdfasdf $docs");
    return Product(
      category: Category.values.byName(docs['category']),
      id: docs['id'],
      isFeatured: docs['isFeatured'],
      name: docs['name'],
      price: docs['price'],
    );
  }
}

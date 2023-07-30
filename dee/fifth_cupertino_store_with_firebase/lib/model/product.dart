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

  // Product.fromSnapshot(Map<String, dynamic> snapshot)
  //     : category = snapshot['category'],
  //       id = snapshot['id'],
  //       isFeatured = snapshot['isFeatured'],
  //       name = snapshot['name'],
  //       price = snapshot['price'];

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final int price;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => '$name (id=$id)';

  
}
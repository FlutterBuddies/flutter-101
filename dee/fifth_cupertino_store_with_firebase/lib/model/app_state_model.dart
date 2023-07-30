import 'package:flutter/foundation.dart' as foundation;

import 'product.dart';

import 'products_repository.dart';

double _salesTaxRate = 0.06;
double _shippingCostPerItem = 7;

// AppStateModel은 앱 상태를 중앙화시키는 방법 
// 그리고 이 상태를 어플리케이션 전체에 걸쳐 사용가능하게 함. 
class AppStateModel extends foundation.ChangeNotifier {
  // All the available products 
  List<Product> _availableProducts = [];

  // The currently selected category of products.
  Category _selectedCategory = Category.all;

  // The IDs and quantities of products currently in the cart. 
  final _productsInCart = <int, int>{};

  Map<int, int> get productsInCart {
    return Map.from(_productsInCart);
  }

  // Totaled prices of the items in the cart.
  double get subtotalCost {
    return _productsInCart.keys.map((id) {
      // Extended price for product line 
      return getProductById(id).price * _productsInCart[id]!;
    }).fold(0, (accumulator, extendedPrice) {
      return accumulator + extendedPrice;
    });
  }


// Total shipping cost for the items in the cart 
double get shippingCost {
  return _shippingCostPerItem *
      _productsInCart.values.fold(0.0, (accumulator, itemCount) {
        return accumulator + itemCount;
      });
}

// Sales tax for the items in the cart
double get tax {
  return subtotalCost * _salesTaxRate;
}

// Total cost to order everything in the cart.
double get totalCost {
  return subtotalCost + shippingCost + tax;
}

// Returns a copy of the list of available products, filtered by category
List<Product> getProducts() => switch (_selectedCategory) {
  Category.all => List.from(_availableProducts),
  _ => _availableProducts
      .where((p) => p.category == _selectedCategory)
      .toList(),
  };

// Search the product catalog 
List<Product> search(String searchTerms) {
  return getProducts().where((product) {
    return product.name.toLowerCase().contains(searchTerms.toLowerCase());
  }).toList();
}

// Adds a product to the cart
void addProductToCart(int productId) {
  if (!_productsInCart.containsKey(productId)) {
    _productsInCart[productId] = 1;
  } else {
    _productsInCart[productId] = _productsInCart[productId]! + 1;
  }
  notifyListeners();
}

// Returns the Product instance matching the provided id.
Product getProductById(int id) {
  return _availableProducts.firstWhere((p) => p.id == id);
}

// Removes everything from the cart. 
void clearCart() {
  _productsInCart.clear();
  notifyListeners();
}

// Loads the list of available products from the repo.
void loadProducts() {
  _availableProducts = ProductsRepository.loadProducts(Category.all); // 나는 여기서 로드 프로덕트를 해야됨 
  notifyListeners();
}

void setCategory(Category newCategory) {
  _selectedCategory = newCategory;
  notifyListeners();
}
}
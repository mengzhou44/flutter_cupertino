import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_cupertino/src/models/product-model.dart'; 

double _salesTaxRate = 0.06;
double _shippingCostPerItem = 7;

class  CartModel extends foundation.ChangeNotifier {
 
  final _productsInCart = <int, int>{};

  Map<int, int> get productsInCart {
    return Map.from(_productsInCart);
  }

  int get totalCartQuantity {
    return _productsInCart.values.fold(0, (accumulator, value) {
      return accumulator + value;
    });
  }

 
  double get subtotalCost {
    return _productsInCart.keys.map((id) {
      return  getProductPrice(id) * _productsInCart[id];
    }).fold(0, (accumulator, extendedPrice) {
      return accumulator + extendedPrice;
    });
  }

Product  getProductById(id) {
     return ProductModel().getProductById(id);
  }

 int getProductPrice(id) {
     Product product = ProductModel().getProductById(id);
     return product.price;
  }

  double get shippingCost {
    return _shippingCostPerItem *
        _productsInCart.values.fold(0.0, (accumulator, itemCount) {
          return accumulator + itemCount;
        });
  }

  double get tax {
    return subtotalCost * _salesTaxRate;
  }

  double get totalCost {
    return subtotalCost + shippingCost + tax;
  }

  void addProductToCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId]++;
    }

    notifyListeners();
  }

  void removeItemFromCart(int productId) {
    if (_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        _productsInCart[productId]--;
      }
    }

    notifyListeners();
  }

  void clearCart() {
    _productsInCart.clear();
    notifyListeners();
  }
}

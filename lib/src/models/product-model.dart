import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
 
import 'products-repository.dart';


class ProductModel  extends foundation.ChangeNotifier {
 
 List<Product> _availableProducts =  ProductsRepository.loadProducts(Category.all);
 

  Category _selectedCategory = Category.all;

  Category get selectedCategory {
    return _selectedCategory;
  }
  
  List<Product> getProducts() {
    if (_availableProducts == null) {
      return [];
    }

    if (_selectedCategory == Category.all) {
      return List.from(_availableProducts);
    } else {
      return _availableProducts.where((p) {
        return p.category == _selectedCategory;
      }).toList();
    }
  }

  List<Product> search(String searchTerms) {
    return getProducts().where((product) {
      return product.name.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }
  
  Product getProductById(int id) {
    return _availableProducts.firstWhere((p) => p.id == id);
  }

  void setCategory(Category newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }
}


enum Category {
  all,
  accessories,
  clothing,
  home,
}

class Product {
  const Product({
    @required this.category,
    @required this.id,
    @required this.isFeatured,
    @required this.name,
    @required this.price,
  })  : assert(category != null),
        assert(id != null),
        assert(isFeatured != null),
        assert(name != null),
        assert(price != null);

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

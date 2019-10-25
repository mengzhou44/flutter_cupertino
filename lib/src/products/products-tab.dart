import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino/src/models/product-model.dart';
import 'package:provider/provider.dart';
 
import 'package:flutter_cupertino/src/products/product-view.dart';


class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductModel>(
      builder: (context, model, child) {
        final products = model.getProducts();
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers:   <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Cupertino Store'),
            ),
            SliverSafeArea(
              top: false,
              minimum:  EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                    if (index < products.length) {
                      return ProductView(
                        index: index,
                        product: products[index],
                        lastItem: index == products.length - 1,
                      );
                    }
                    return null;
                  }
                ),
              ),
            )
          ],
        );
      },
    );
  }
}


  
               
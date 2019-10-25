import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino/src/models/cart-model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../styles.dart';
import 'cart-item.dart';

class CartTab extends StatefulWidget {
  @override
  _CartTabState createState() {
    return _CartTabState();
  }
}

class _CartTabState extends State<CartTab> {
  final _currencyFormat = NumberFormat.currency(symbol: '\$');
  SliverChildBuilderDelegate _buildSliverChildBuilderDelegate(CartModel model) {
    return SliverChildBuilderDelegate(
      (context, index) {
           final productIndex = index;
       
            if (model.productsInCart.length > productIndex) {
              return CartItem(
                index: index,
                product: model.getProductById(
                    model.productsInCart.keys.toList()[productIndex]),
                quantity: model.productsInCart.values.toList()[productIndex],
                lastItem: productIndex == model.productsInCart.length - 1,
                formatter: _currencyFormat,
              );
            } else if (model.productsInCart.keys.length == productIndex &&
                model.productsInCart.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Shipping '
                          '${_currencyFormat.format(model.shippingCost)}',
                          style: Styles.productRowItemPrice,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Tax ${_currencyFormat.format(model.tax)}',
                          style: Styles.productRowItemPrice,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Total  ${_currencyFormat.format(model.totalCost)}',
                          style: Styles.productRowTotal,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
           return null; 
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, model, child) {
        return CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Shopping Cart'),
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 4),
              sliver: SliverList(
                delegate: _buildSliverChildBuilderDelegate(model),
              ),
            )
          ],
        );
      },
    );
  }
}

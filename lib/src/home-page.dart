import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino/src/cart/cart-tab.dart';
import 'package:flutter_cupertino/src/products/products-tab.dart';
import 'package:flutter_cupertino/src/profile/profile-tab.dart';
import 'package:flutter_cupertino/src/search/search-tab.dart';
 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            title: Text('Account'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ProductsTab(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SearchTab(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CartTab(),
              );
            });
          default: 
              return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: ProfileTab(),
                  );
                  });
          
        }
      },
    );
  }
}
 
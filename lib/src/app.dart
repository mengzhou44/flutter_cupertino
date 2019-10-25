import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'home-page.dart';
import 'models/cart-model.dart';
import 'models/product-model.dart';
 

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
         providers: [
             ChangeNotifierProvider<ProductModel>(
                      builder: (context) => ProductModel(),
                    ),
            ChangeNotifierProvider<CartModel>(
                      builder: (context) => CartModel(),
                    ),
         ],
         child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

 
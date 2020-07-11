import 'package:Shop/providers/product.dart';
import 'package:Shop/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String prodcutId =
        ModalRoute.of(context).settings.arguments as String;
    final Product selectedProduct =
        //context.watch<ProductProvider>().findById(prodcutId);
        Provider.of<ProductProvider>(context, listen: false)
            .findById(prodcutId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedProduct.title}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${selectedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                '${selectedProduct.description}',
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

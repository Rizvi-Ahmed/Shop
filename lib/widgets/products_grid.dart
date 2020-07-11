import 'package:Shop/providers/product.dart';
import 'package:Shop/providers/product_provider.dart';
import 'package:Shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoriteProductsOnly;
  ProductsGrid(this.showFavoriteProductsOnly);
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<ProductProvider>(context);
    final List<Product> products = showFavoriteProductsOnly
        ? productContainer.favoriteProductsOnly
        : productContainer.productItems;
    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(
              // id: products[index].id,
              // title: products[index].title,
              // description: products[index].description,
              // imageUrl: products[index].imageUrl,
              // isFavorite: products[index].isFavorite,
              ),
        );
      },
      itemCount: products.length,
    );
  }
}

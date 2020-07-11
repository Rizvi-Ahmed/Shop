import 'package:Shop/providers/cart.dart';
import 'package:Shop/screens/cart_screen.dart';
import 'package:Shop/widgets/app_drawer.dart';
import 'package:Shop/widgets/badge.dart';
import 'package:Shop/widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProudctOverviewScreen extends StatefulWidget {
  @override
  _ProudctOverviewScreenState createState() => _ProudctOverviewScreenState();
}

class _ProudctOverviewScreenState extends State<ProudctOverviewScreen> {
  bool _showFavoriteProductsOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites)
                  _showFavoriteProductsOnly = true;
                else
                  _showFavoriteProductsOnly = false;
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text(
                  'Only Favorites',
                ),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text(
                  'Show All',
                ),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.cartItemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showFavoriteProductsOnly),
    );
  }
}

import 'package:Shop/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String cartId;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    @required this.cartId,
    @required this.productId,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartId),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete_forever,
          size: 40,
          color: Theme.of(context).primaryIconTheme.color,
        ),
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (dismissDirection) {
        Provider.of<Cart>(context, listen: false).removeCartItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(child: Text('\$$price')),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Total: ${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}

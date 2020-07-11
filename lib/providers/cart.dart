import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quatity;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quatity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get cartItemCount {
    return _items.length;
  }

  double get totalCost {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quatity;
    });
    return total;
  }

  void additems({
    @required String productId,
    @required double price,
    @required String title,
  }) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingcardItem) => CartItem(
          id: existingcardItem.id,
          title: existingcardItem.title,
          price: existingcardItem.price,
          quatity: existingcardItem.quatity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quatity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeCartItem(String key) {
    _items.remove(key);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}

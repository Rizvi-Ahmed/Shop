import 'package:Shop/providers/orders.dart' show Orders;
import 'package:Shop/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = context.watch<Orders>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return OrderItem(orderData.orders[index]);
        },
        itemCount: orderData.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}

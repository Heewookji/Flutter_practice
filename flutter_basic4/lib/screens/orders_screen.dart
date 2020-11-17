import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider.dart' show OrdersProvider;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrdersProvider>(context, listen: false)
            .fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (dataSnapshot.error == null) {
            return Consumer<OrdersProvider>(
              builder: (context, orderData, child) => ListView.builder(
                itemCount: orderData.orders.length,
                itemBuilder: (ctx, i) {
                  return OrderItem(orderData.orders[i]);
                },
              ),
            );
          }
          return Text('An error occurred!');
        },
      ),
    );
  }
}

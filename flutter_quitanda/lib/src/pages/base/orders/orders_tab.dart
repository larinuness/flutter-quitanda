// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';

import '../../../app_data.dart' as appData;
import '../../components/custom_order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => CustomOrderTile(
                order: appData.orders[index],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: appData.orders.length),
    );
  }
}

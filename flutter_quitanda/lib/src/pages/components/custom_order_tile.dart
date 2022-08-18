import 'package:flutter/material.dart';

import '../../models/cart_item_model.dart';
import '../../models/order_model.dart';
import '../../utils/utils_services.dart';
import 'custom_order_status.dart';
import 'custom_payment_dialog.dart';

class CustomOrderTile extends StatelessWidget {
  final OrderModel order;
  CustomOrderTile({Key? key, required this.order}) : super(key: key);

  final utils = UtilsService();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      //Widget que expande pra ver mais detalhess
      child: Theme(
        //pro divisor não aparecer
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == "pending_payment",
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utils.formatDateTime(order.createdDateTime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          //deixa o texto começando pela a esquerda
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //cresce o tamanho necessario
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((ordemItem) {
                          return _OrderItemWidget(
                            utils: utils,
                            ordemItem: ordemItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomOrderStatus(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 16),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: utils.priceToCurrency(order.total),
                    style: const TextStyle(),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomPaymentDialog(
                          order: order,
                        );
                      });
                },
                icon: const Icon(Icons.pix),
                label: const Text('Ver QR Code Pix'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  final CartItemModel ordemItem;
  const _OrderItemWidget({
    Key? key,
    required this.utils,
    required this.ordemItem,
  }) : super(key: key);

  final UtilsService utils;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${ordemItem.quantity} ${ordemItem.item.unit} ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(ordemItem.item.name),
          ),
          Text(
            utils.priceToCurrency(
              ordemItem.totalPrice(),
            ),
          ),
        ],
      ),
    );
  }
}

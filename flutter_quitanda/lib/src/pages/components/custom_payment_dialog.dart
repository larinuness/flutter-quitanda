import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/order_model.dart';
import '../../utils/utils_services.dart';

class CustomPaymentDialog extends StatelessWidget {
  final OrderModel order;
  CustomPaymentDialog({Key? key, required this.order}) : super(key: key);

  final utils = UtilsService();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Pagamento com Pix',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                QrImage(
                  data: "30432472783979",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Vencimento: ${utils.formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Total: ${utils.priceToCurrency(order.total)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.copy, size: 15),
                  label: const Text(
                    'Copiar código pix',
                    style: TextStyle(fontSize: 13),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 2,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
              ),
            ),
          )
        ],
      ),
    );
  }
}

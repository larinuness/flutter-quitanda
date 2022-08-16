import 'package:flutter/material.dart';
import 'package:flutter_quitanda/src/pages/components/custom_quantity.dart';

import '../../models/cart_item_model.dart';
import '../../utils/utils_services.dart';

class CustomCartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;
  const CustomCartTile({Key? key, required this.cartItem, required this.remove})
      : super(key: key);

  @override
  State<CustomCartTile> createState() => _CustomCartTileState();
}

class _CustomCartTileState extends State<CustomCartTile> {
  final utils = UtilsService();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListTile(
        leading: Image.asset(widget.cartItem.item.img, height: 60, width: 60),
        title: Text(
          widget.cartItem.item.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          utils.priceToCurrency(widget.cartItem.totalPrice()),
        ),
        trailing: CustomQuantity(
            isRemovable: true,
            value: widget.cartItem.quantity,
            suffixText: widget.cartItem.item.unit,
            result: (quantity) {
              setState(() {
                widget.cartItem.quantity == quantity;

                if (quantity == 0) {
                  widget.remove(widget.cartItem);
                }
              });
            }),
      ),
    );
  }
}

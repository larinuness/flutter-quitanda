import 'item_model.dart';

class CartItemModel {
  final ItemModel item;
  final int quantity;

  CartItemModel({
    required this.item,
    required this.quantity,
  });

  double totalPrice() => item.price * quantity;
}

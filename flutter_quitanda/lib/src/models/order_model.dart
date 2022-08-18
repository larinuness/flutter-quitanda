import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final DateTime createdDateTime;
  List<CartItemModel> items;
  //data validade do pix
  final DateTime overdueDateTime;
  final String status;
  final String copyAndPaste;
  final double total;
  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.items,
    required this.overdueDateTime,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}

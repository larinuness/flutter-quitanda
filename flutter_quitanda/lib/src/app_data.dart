import 'models/cart_item_model.dart';
import 'models/item_model.dart';
import 'models/order_model.dart';
import 'models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  img: 'assets/frutas/apple.png',
  name: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  img: 'assets/frutas/grape.png',
  name: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  img: 'assets/frutas/guava.png',
  name: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  img: 'assets/frutas/kiwi.png',
  name: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  img: 'assets/frutas/mango.png',
  name: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  img: 'assets/frutas/papaya.png',
  name: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

final categories = [
  'Frutas',
  'Grãos',
  'Legumes',
  'Verduras',
  'Cereais',
  'Temperos'
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 3),
  CartItemModel(item: kiwi, quantity: 1),
  CartItemModel(item: mango, quantity: 1),
];

UserModel user = UserModel(
    phone: '11 9 49399308',
    cpf: '999.999.999.99',
    email: 'larissa@teste.com',
    name: 'Larissa',
    password: '');

List<OrderModel> orders = [
  OrderModel(
      id: '1',
      createdDateTime: DateTime.parse('2023-08-16 10:00:10.458'),
      items: [
        CartItemModel(item: apple, quantity: 2),
        CartItemModel(item: mango, quantity: 2),
      ],
      overdueDateTime: DateTime.parse('2023-08-16 10:00:10.458'),
      status: 'pending_payment',
      copyAndPaste: 'Teste copia e cola',
      total: 11.0),
  OrderModel(
      id: '2',
      createdDateTime: DateTime.parse('2023-08-16 10:00:10.458'),
      items: [
        CartItemModel(item: apple, quantity: 2),
        CartItemModel(item: mango, quantity: 2),
      ],
      overdueDateTime: DateTime.parse('2023-08-16 10:00:10.458'),
      status: 'delivered',
      copyAndPaste: 'Teste copia e cola',
      total: 11.0),
];

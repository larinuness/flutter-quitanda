import 'package:flutter/material.dart';

import '../../models/item_model.dart';
import '../../utils/utils_services.dart';
import '../base/home/product/product_page.dart';

class CustomItemTile extends StatelessWidget {
  final void Function(GlobalKey) cartAnimationMethod;
  final ItemModel item;
  final GlobalKey imgGk = GlobalKey();
  CustomItemTile(
      {Key? key, required this.item, required this.cartAnimationMethod})
      : super(key: key);

  final utils = UtilsService();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductPage(item: item)));
          },
          child: Card(
            elevation: 2,
            shadowColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: item.img,
                      child: Image.asset(
                        item.img,
                        key: imgGk,
                      ),
                    ),
                  ),
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(utils.priceToCurrency(item.price),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green)),
                      Text(
                        item.unit,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(
                15,
              ),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  cartAnimationMethod(imgGk);
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

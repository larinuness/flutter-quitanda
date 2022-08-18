// ignore_for_file: library_prefixes

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../../app_data.dart' as appData;
import '../../../utils/utils_services.dart';
import '../../components/custom_category_tile.dart';
import '../../components/custom_item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectCategory = 'Frutas';

  GlobalKey<CartIconKey> globalKeyCartIcon = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  final utils = UtilsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            utils.showToast(
              message: 'Olá mundo',
            );
          },
          child: const Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 30,
              ),
              children: [
                TextSpan(
                  text: 'Green',
                  style: TextStyle(color: Colors.green),
                ),
                TextSpan(
                  text: 'grocer',
                  style: TextStyle(
                    color: Color.fromARGB(255, 132, 18, 10),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: Colors.red,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartIcon,
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: AddToCartAnimation(
        gkCart: globalKeyCartIcon,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          // You can run the animation by addToCardAnimationMethod, just pass trough the the global key of  the image as parameter
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  //não deixa com muito espaço
                  isDense: true,
                  //hintText porque vai sumir quando começar digitar
                  hintText: 'Pesquise aqui',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    //deixa sem borda
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(
                      60,
                    ),
                  ),
                ),
              ),
            ),
            //mostra de forma separada
            Container(
              padding: const EdgeInsets.only(
                left: 25,
              ),
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomCategoryTile(
                      category: appData.categories[index],
                      isSelected: appData.categories[index] == selectCategory,
                      onPressed: () {
                        setState(() {
                          selectCategory = appData.categories[index];
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: appData.categories.length),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                itemCount: appData.items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 12.5,
                ),
                itemBuilder: (context, index) {
                  return CustomItemTile(
                    item: appData.items[index],
                    cartAnimationMethod: itemSelectedCartAnimation,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

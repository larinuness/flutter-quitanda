import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../components/custom_category_tale.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final categories = ['Frutas', 'Grãos', 'Legumes', 'Verduras', 'Cereais'];

  String selectCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
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
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                ),
              ),
            ),
          )
        ],
        title: const Text.rich(
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
      body: Column(
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
                    category: categories[index],
                    isSelected: categories[index] == selectCategory,
                    onPressed: () {
                      setState(() {
                        selectCategory = categories[index];
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: categories.length),
          ),
        ],
      ),
    );
  }
}
